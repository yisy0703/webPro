package com.lec.friend;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FriendDao {
	public static final int SUCCESS = 1; 
	public static final int FAIL = 0;    
	// 싱글톤
	private static FriendDao instance= new FriendDao();
	public static FriendDao getInstance() {
		return instance;
	}	
	private FriendDao() {}
	// 커넥션 풀을 이용한 getConnection함수 : getConnection()
	private Connection getConnection() throws SQLException { // 커넥션 풀 이용
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage()+"context에러");
		}
		return conn;
	}
	// 친구 전부 가져오기
	public ArrayList<FriendDto> getAllFriends(){
		ArrayList<FriendDto> dtos = new ArrayList<FriendDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM FRIEND";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no      = rs.getInt("no");
				String name = rs.getString("name");
				String tel  = rs.getString("tel");
				dtos.add(new FriendDto(no, name, tel));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e) { }
		}
		return dtos;
	}
	// 친구 추가
	public int insertFriend(FriendDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FRIEND VALUES (FRIEND_NO_SEQ.NEXTVAL, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS ? "친구 추가 성공":"친구 추가 실패"+dto);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("친구 추가 실패 "+dto);
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e) { }
		}
		return result;
	}
	// 친구 전부 가져오기
	public ArrayList<FriendDto> getSchFriends(String schName, String schTel){
		ArrayList<FriendDto> dtos = new ArrayList<FriendDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM FRIEND WHERE NAME LIKE '%'||?||'%' AND TEL LIKE '%'||?||'%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schName);
			pstmt.setString(2, schTel);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no      = rs.getInt("no");
				String name = rs.getString("name");
				String tel  = rs.getString("tel");
				dtos.add(new FriendDto(no, name, tel));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e) { }
		}
		return dtos;
	}
}











