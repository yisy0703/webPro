package com.lec.snedit.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

import com.lec.snedit.dto.BDto;

public class BDao {
	private DataSource ds;
	public BDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	public ArrayList<BDto> list(){
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT BNO, BTITLE, BCONTENT, BFILE, (SELECT COUNT(*) FROM COMMENTS WHERE BNO=B.BNO) CNT" + 
				"  FROM B ORDER BY BRDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				String bfile = rs.getString("bfile");
				int cnt = rs.getInt("cnt");
				dtos.add(new BDto(bno, btitle, bcontent, bfile, cnt));
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
	public int write(BDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO B (BNO, BTITLE, BCONTENT, BFILE) VALUES (B_SEQ.NEXTVAL, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBfile());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	public BDto getDto(int bno) {
		BDto dto = null;
		Connection      conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT BNO, BTITLE, BCONTENT, BFILE, (SELECT COUNT(*) FROM COMMENTS WHERE BNO=B.BNO) CNT " + 
				"  FROM B where bno=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				String bfile = rs.getString("bfile");
				int cnt = rs.getInt("cnt");
				dto = new BDto(bno, btitle, bcontent, bfile, cnt);
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
	public int modify(BDto dto) {
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE B " + 
				"  SET BTITLE = ?," + 
				"      BCONTENT = ?," + 
				"      BFILE = ?" + 
				"  WHERE BNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getBfile());
			pstmt.setInt(4, dto.getBno());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
}