package com.lec.snedit.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

import com.lec.snedit.dto.BDto;
import com.lec.snedit.dto.ReplyDto;

public class ReplyDao {
	private DataSource ds;
	public ReplyDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	public ArrayList<ReplyDto> replyList(int bno){
		ArrayList<ReplyDto> dtos = new ArrayList<ReplyDto>();
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM REPLY WHERE BNO=? ORDER BY RDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String rcontent = rs.getString("rcontent");
				String rip = rs.getString("rip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dtos.add(new ReplyDto(rno, bno, rcontent, rip, rdate));
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
	public int write(ReplyDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REPLY (RNO, BNO, RCONTENT, RIP) " + 
				"    VALUES (REPLY_SEQ.NEXTVAL, ?, ?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getRcontent());
			pstmt.setString(3, dto.getRip());
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
	public ReplyDto getDto(int rno) {
		ReplyDto dto = null;
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM REPLY WHERE RNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String rcontent = rs.getString("rcontent");
				String rip = rs.getString("rip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dto = new ReplyDto(rno, bno, rcontent, rip, rdate);
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
	public int replyModify(ReplyDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REPLY SET RCONTENT = ?, RIP=? WHERE RNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRcontent());
			pstmt.setString(2, dto.getRip());
			pstmt.setInt(3, dto.getRno());
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