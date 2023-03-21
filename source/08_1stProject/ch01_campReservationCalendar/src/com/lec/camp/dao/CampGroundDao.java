package com.lec.camp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.camp.dto.CampGroundDto;

public class CampGroundDao {
	private DataSource ds;
	// 싱글톤
	private static CampGroundDao instance = new CampGroundDao();
	public static CampGroundDao getInstance() {
		return instance;
	}
	// 생성자에서 ds 할당
	private CampGroundDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	//  1. 캠핑장들 list
	public ArrayList<CampGroundDto> listCamp(){
		ArrayList<CampGroundDto> dtos = new ArrayList<CampGroundDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CAMPGROUND ORDER BY CNO";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt("cno");
				String cname = rs.getString("cname");
				String target = rs.getString("target");
				String image = rs.getString("image");
				dtos.add(new CampGroundDto(cno, cname, target, image));
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
	//  2. 특정 캠핑장
	public CampGroundDto getCamp(int cno){
		CampGroundDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CAMPGROUND WHERE CNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String cname = rs.getString("cname");
				String target = rs.getString("target");
				String image = rs.getString("image");
				dto = new CampGroundDto(cno, cname, target, image);
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
}
