package com.lec.snedit.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

import com.lec.snedit.dto.BDto;
import com.lec.snedit.dto.CommentsDto;

public class CommentsDao {
	private DataSource ds;
	public CommentsDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	public ArrayList<CommentsDto> commentsList(int bno){
		ArrayList<CommentsDto> dtos = new ArrayList<CommentsDto>();
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM COMMENTS WHERE BNO=? ORDER BY CDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt("cno");
				String ccontent = rs.getString("ccontent");
				String cip = rs.getString("cip");
				Timestamp cdate = rs.getTimestamp("cdate");
				dtos.add(new CommentsDto(cno, bno, ccontent, cip, cdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dtos;
	}
	public int write(CommentsDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO COMMENTS (CNO, BNO, CCONTENT, CIP) " + 
				"    VALUES (COMMENTS_SEQ.NEXTVAL, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getCcontent());
			pstmt.setString(3, dto.getCip());
			result = pstmt.executeUpdate();
			System.out.println(result==1? "댓글쓰기성공":dto+"댓글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"댓글쓰기실패 : " +dto);
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	public CommentsDto getDto(int cno) {
		CommentsDto dto = null;
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM REPLY WHERE RNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String ccontent = rs.getString("ccontent");
				String cip = rs.getString("cip");
				Timestamp cdate = rs.getTimestamp("cdate");
				dto = new CommentsDto(cno, bno, ccontent, cip, cdate);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;
	}
	public int replyModify(CommentsDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE COMMENTS SET cCONTENT = ?, cIP=? WHERE cNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCcontent());
			pstmt.setString(2, dto.getCip());
			pstmt.setInt(3, dto.getCno());
			result = pstmt.executeUpdate();
			System.out.println(result==1? "댓글수정성공":dto+"댓글 수정 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"댓글 수정 실패 : " +dto);
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
}