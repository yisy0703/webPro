package com.lec.ex.dao;
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

import com.lec.ex.dto.BoardDto;
public class BoardDao {
	private final int SUCCESS = 1;
	private final int FAIL    = 0;
	private DataSource ds;
	public BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. 글목록(startRow ~ endRow까지)
	public ArrayList<BoardDto> list(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * " + 
				"  FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM (SELECT * FROM MVC_BOARD ORDER BY BGROUP DESC, BSTEP) A)" + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int    bid      = rs.getInt("bid");
				String bname    = rs.getString("bname");
				String btitle   = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Timestamp bdate = rs.getTimestamp("bdate");
				int    bhit     = rs.getInt("bhit");
				int    bgroup   = rs.getInt("bgroup");
				int    bstep    = rs.getInt("bstep");
				int    bindent  = rs.getInt("bindent");
				String bip      = rs.getString("bip");
				dtos.add(new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, 
						bgroup, bstep, bindent, bip));
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
		return dtos;
	}
	// 2. 전체 글 갯수
	public int getBoardTotCnt() {
		int totCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM MVC_BOARD";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt(1);
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
		return totCnt;
	}
	// 3. 원글 쓰기 (bname, btitle, bcontent, bip)
	public int write(String bname, String btitle, String bcontent, String bip) {
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
			pstmt.setString(1, bname);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bip);
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
	// 8. 글 삭제
	public int delete(int bid) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MVC_BOARD WHERE bID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글삭제 성공":"글번호(bid) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 삭제 실패 ");
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
	// 9. 답변글 저장전 작업(STEP ⓐ)
	private void preReplyStep(int bgroup, int bstep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MVC_BOARD SET BSTEP = BSTEP + 1 " + 
				"  WHERE BGROUP = ? AND BSTEP > ?";
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
	}
	// 10. 답변글 쓰기
}













