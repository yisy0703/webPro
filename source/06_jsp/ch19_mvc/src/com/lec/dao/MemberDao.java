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
	public final int SUCCESS = 1;
	public final int FAIL = 0;
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
				members.add(new MemberDto(id, pw, name, birth, rdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return members;
	}
	// 2. 회원가입
	public int joinMember(MemberDto member) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (ID, PW, NAME, BIRTH)" + 
				"  VALUES (?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getBirth());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("가입 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "회원가입 실패 : " + member);
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return result;
	}
}















