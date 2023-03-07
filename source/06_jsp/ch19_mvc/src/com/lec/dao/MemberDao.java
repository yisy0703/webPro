package com.lec.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.MemberDto;
public class MemberDao {
	private DataSource ds;
	// 싱글톤
	private static MemberDao instance;
	public static MemberDao getInstance() {
		if(instance==null) {
			instance = new MemberDao();
		}
		return instance;
	}
	private MemberDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. 회원 리스트
	public ArrayList<MemberDto> listMember(){
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		String sql = "SELECT * FROM MEMBER";
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw").replaceAll("[a-zA-Z0-9~`!@#$%^&*()\\-_+=|\\{}\\[\\]:;\"'?/<>,\\.]", "*");
				String name = rs.getString("name");
				Timestamp birth = rs.getTimestamp("birth");
				Timestamp rdate = rs.getTimestamp("rdate");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return members;
	}
	// 2. 회원가입
}















