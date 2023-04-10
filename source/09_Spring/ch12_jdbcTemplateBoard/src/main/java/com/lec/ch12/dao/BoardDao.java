package com.lec.ch12.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.lec.ch12.dto.BoardDto;
import com.lec.ch12.util.Constant;
public class BoardDao {
	private final int SUCCESS = 1;
	private final int FAIL    = 0;
	private JdbcTemplate template;
	private DataSource ds;
	public BoardDao() {
		template = Constant.template;
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. 글목록(startRow ~ endRow까지)
	public ArrayList<BoardDto> list(){
		String sql = "SELECT * " + 
				"  FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM (SELECT * FROM MVC_BOARD ORDER BY BGROUP DESC, BSTEP) A)";
		return (ArrayList<BoardDto>) template.query(sql, 
						new BeanPropertyRowMapper<BoardDto>(BoardDto.class));
	}
	// 1. 글목록(startRow ~ endRow까지)
	public ArrayList<BoardDto> list(final int startRow, final int endRow){
		String sql = "SELECT * " + 
				"  FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM (SELECT * FROM MVC_BOARD ORDER BY BGROUP DESC, BSTEP) A)" + 
				"  WHERE RN BETWEEN ? AND ?";
		return (ArrayList<BoardDto>) template.query(sql, 
				new PreparedStatementSetter() {
					@Override
					public void setValues(PreparedStatement pstmt) throws SQLException {
						pstmt.setInt(1, startRow);
						pstmt.setInt(2, endRow);
					}
				},
				new BeanPropertyRowMapper<BoardDto>(BoardDto.class));
	}
	// 2. 전체 글 갯수
	public int getBoardTotCnt() {
		String sql = "SELECT COUNT(*) FROM MVC_BOARD";
		return template.queryForObject(sql, Integer.class);
	}
	// 3. 원글 쓰기 (bname, btitle, bcontent, bip)
	public int write(final String bname, final String btitle, final String bcontent, final String bip) {
//		String sql = "INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, "
//				+ "							BGROUP, BSTEP, BINDENT, BIP)" + 
//				" VALUES (MVC_BOARD_SEQ.NEXTVAL, ?, ?, ?, "
//				+ "							MVC_BOARD_SEQ.CURRVAL, 0, 0, ?)";
//		return template.update(sql, new PreparedStatementSetter() {
//			@Override
//			public void setValues(PreparedStatement pstmt) throws SQLException {
//				pstmt.setString(1, bname);
//				pstmt.setString(2, btitle);
//				pstmt.setString(3, bcontent);
//				pstmt.setString(4, bip);
//			}
//		});
		return template.update(new PreparedStatementCreator() {
			String sql = "INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, "
					+ "							BGROUP, BSTEP, BINDENT, BIP)" + 
					" VALUES (MVC_BOARD_SEQ.NEXTVAL, ?, ?, ?, "
					+ "							MVC_BOARD_SEQ.CURRVAL, 0, 0, ?)";
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bname);
				pstmt.setString(2, btitle);
				pstmt.setString(3, bcontent);
				pstmt.setString(4, bip);
				return pstmt;
			}
		});
	}
	// 3. 원글 쓰기 (bname, btitle, bcontent, bip)
	public int write(BoardDto bDto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT, "
				+ "							BGROUP, BSTEP, BINDENT, BIP)" + 
				" VALUES (MVC_BOARD_SEQ.NEXTVAL, ?, ?, ?, "
				+ "							MVC_BOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bDto.getBname());
			pstmt.setString(2, bDto.getBtitle());
			pstmt.setString(3, bDto.getBcontent());
			pstmt.setString(4, bDto.getBip());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("원글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 원글쓰기 실패 :");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
	// 4. bID로 조회수 1 올리기
	private void hitUp(int bid) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MVC_BOARD SET bHIT = bHIT + 1 WHERE bID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 조회수 up 실패");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
	}
	// 5. bID로 DTO가져오기 (글상세보기) -- 조회수 올리고 dto가져오기
	public BoardDto content(int bid) {
		BoardDto dto = null;
		hitUp(bid); // 글 상세보기 시 조회수 1 올리기
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MVC_BOARD WHERE bID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String bname    = rs.getString("bname");
				String btitle   = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Timestamp bdate = rs.getTimestamp("bdate");
				int    bhit     = rs.getInt("bhit");
				int    bgroup   = rs.getInt("bgroup");
				int    bstep    = rs.getInt("bstep");
				int    bindent  = rs.getInt("bindent");
				String bip      = rs.getString("bip");
				dto = new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, 
						bgroup, bstep, bindent, bip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return dto;
	}
	// 6. bID로 DTO가져오기 (글수정VIEW, 답변글VIEW) -- dto 가져오기
	public BoardDto modifyView_replyView(int bid) {
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MVC_BOARD WHERE bID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String bname    = rs.getString("bname");
				String btitle   = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Timestamp bdate = rs.getTimestamp("bdate");
				int    bhit     = rs.getInt("bhit");
				int    bgroup   = rs.getInt("bgroup");
				int    bstep    = rs.getInt("bstep");
				int    bindent  = rs.getInt("bindent");
				String bip      = rs.getString("bip");
				dto = new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, 
						bgroup, bstep, bindent, bip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return dto;
	}
	// 7. 글 수정 (특정 bid의 작성자, 글제목, 글본문, bip만 수정)
	public int modify(int bid, String bname, String btitle, String bcontent, 
																	String bip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MVC_BOARD " + 
				"  SET BNAME = ?," + 
				"      BTITLE = ?, " + 
				"      BCONTENT = ?, " + 
				"      BIP = ?" + 
				"  WHERE BID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bip);
			pstmt.setInt(5, bid);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글수정 성공":"글번호(bid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 수정 실패 ");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
	// 7. 글 수정 (특정 bid의 작성자, 글제목, 글본문, bip만 수정)
	public int modify(BoardDto bDto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MVC_BOARD " + 
				"  SET BNAME = ?," + 
				"      BTITLE = ?, " + 
				"      BCONTENT = ?, " + 
				"      BIP = ?" + 
				"  WHERE BID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bDto.getBname());
			pstmt.setString(2, bDto.getBtitle());
			pstmt.setString(3, bDto.getBcontent());
			pstmt.setString(4, bDto.getBip());
			pstmt.setInt(5, bDto.getBid());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글수정 성공":"글번호(bid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 수정 실패 ");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
	// 8. 글 삭제
	public int delete(final int bid) {
		//방법1
//		String sql = "DELETE FROM MVC_BOARD WHERE bID = "+bid;
//		return template.update(sql);
		// 방법2
//		String sql = "DELETE FROM MVC_BOARD WHERE bID = ?";
//		return template.update(sql, new PreparedStatementSetter() {
//			@Override
//			public void setValues(PreparedStatement pstmt) throws SQLException {
//				pstmt.setInt(1, bid);
//			}
//		});
		// 방법3
		return template.update(new PreparedStatementCreator() {
			String sql = "DELETE FROM MVC_BOARD WHERE bID = ?";
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bid);
				return pstmt;
			}
		});
	}
	// 9. 답변글 저장전 작업(STEP ⓐ)
	private void preReplyStep(int bgroup, int bstep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MVC_BOARD SET BSTEP = BSTEP + 1 " + 
				"  WHERE BGROUP = ? AND BSTEP > ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			pstmt.setInt(2, bstep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " preReplyStep에서 오류");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
	}
	// 10. 답변글 쓰기
	//       답변글쓴이    : bname, btitle, bcontent
	//       시스템적으로 : bip
	//       원글             : bgroup, bstep, bindent
	public int reply(String bname, String btitle, String bcontent, String bip,
						int bgroup, int bstep, int bindent) {
		int result = FAIL;
		preReplyStep(bgroup, bstep);
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT,"
				+ "							 BGROUP, BSTEP, BINDENT, BIP)" + 
				"  VALUES (MVC_BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setInt(4, bgroup);
			pstmt.setInt(5, bstep + 1);
			pstmt.setInt(6, bindent + 1);
			pstmt.setString(7, bip);
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("답변글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 답변글쓰기 실패 ");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
	// 10. 답변글 쓰기
	//       답변글쓴이    : bname, btitle, bcontent
	//       시스템적으로 : bip
	//       원글             : bgroup, bstep, bindent
	public int reply(BoardDto bDto) {
		int result = FAIL;
		preReplyStep(bDto.getBgroup(), bDto.getBstep());
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MVC_BOARD (BID, BNAME, BTITLE, BCONTENT,"
				+ "							 BGROUP, BSTEP, BINDENT, BIP)" + 
				"  VALUES (MVC_BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bDto.getBname());
			pstmt.setString(2, bDto.getBtitle());
			pstmt.setString(3, bDto.getBcontent());
			pstmt.setInt(4, bDto.getBgroup());
			pstmt.setInt(5, bDto.getBstep() + 1);
			pstmt.setInt(6, bDto.getBindent() + 1);
			pstmt.setString(7, bDto.getBip());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("답변글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 답변글쓰기 실패 ");
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
}