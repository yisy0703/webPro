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
	// 3. 원글 쓰기
	// 4. bID로 조회수 1 올리기
	// 5. bID로 DTO가져오기 (글상세보기) -- 조회수 올리고 dto가져오기
	// 6. bID로 DTO가져오기 (글수정VIEW, 답변글VIEW) -- dto 가져오기
	// 7. 글 수정
	// 8. 글 삭제
	// 9. 답변글 저장전 작업(STEP ⓐ)
	// 10. 답변글 쓰기
}













