package com.lec.customer;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CustomerDao {
	public static final int SUCCESS = 1; // 회원가입, 정보수정시 성공할 때 리턴값
	public static final int FAIL = 0; // 회원가입, 정보수정시 실패할 때 리턴값
	public static final int CUSTOMER_EXISTENT = 0; // 중복된 ID일 때 리턴값
	public static final int CUSTOMER_NONEXISTENT = 1; // 사용가능한 ID일 때 리턴값
	public static final int LOGIN_SUCCESS = 1; // 로그인 성공시 리턴값
	public static final int LOGIN_FAIL = 0; // 로그인 실패시 리턴값
	// 싱글톤
	private static CustomerDao instance = new CustomerDao(); // 자기가 자기 클래스형 객체를 참조
	public static CustomerDao getInstance() {
		return instance;
	}
	private CustomerDao() {}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		// 컨넥션 풀의 DataSource안의 conn 객체를 리턴
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection(); // DataSource안의 conn을 가져오기
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	// 1. 회원가입시 id 중복체크 : 
	public int confirmId(String cid) {
		int result = CUSTOMER_EXISTENT; // 초기화
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM CUSTOMER WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt == 0) {
				result = CUSTOMER_NONEXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 2. 회원가입
	public int joinCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER "
				+ "(CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CBIRTH, CGENDER)"
				+ "  VALUES "
				+ "(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid());
			pstmt.setString(2, dto.getCpw());
			pstmt.setString(3, dto.getCname());
			pstmt.setString(4, dto.getCtel());
			pstmt.setString(5, dto.getCemail());
			pstmt.setString(6, dto.getCaddress());
			pstmt.setDate(7, dto.getCbirth());
			pstmt.setString(8, dto.getCgender());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "회원가입성공":"회원가입실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원가입 실패 : " + dto);
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 3. 로그인 
	public int loginCheck(String cid, String cpw) {
		int result = LOGIN_FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CUSTOMER "
				+ "WHERE CID=? AND CPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, cpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// cid와 cpw가 올바른 경우
				result = LOGIN_SUCCESS;
			}else {
				// cid나 cpw가 틀린 경우
				result = LOGIN_FAIL;
			}			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 4. ID로 dto가져오기 : 로그인 성공시 session에 setAttribute / 회원정보 수정시 회원정보 가져오기
	public CustomerDto getCustomer(String cid) {
		CustomerDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CUSTOMER WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String cpw      = rs.getString("cpw");;
				String cname    = rs.getString("cname");
				String ctel     = rs.getString("ctel");;
				String cemail   = rs.getString("cemail");;
				String caddress =rs.getString("caddress");;
				Date   cbirth   = rs.getDate("cbirth");;
				String cgender  = rs.getString("cgender");
				Timestamp crdate=rs.getTimestamp("crdate");
				dto = new CustomerDto(cid, cpw, cname, ctel, cemail, caddress, cbirth, cgender, crdate);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	// 5. 회원정보수정
	public int modifyCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER SET CPW = ?," + 
				"                CNAME=?," + 
				"                CTEL = ?," + 
				"                CEMAIL=?, " + 
				"                CADDRESS=?, " + 
				"                CBIRTH = ? ," + 
				"                CGENDER = ?" + 
				"          WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCpw());
			pstmt.setString(2, dto.getCname());
			pstmt.setString(3, dto.getCtel());
			pstmt.setString(4, dto.getCemail());
			pstmt.setString(5, dto.getCaddress());
			pstmt.setDate(6, dto.getCbirth());
			pstmt.setString(7, dto.getCgender());
			pstmt.setString(8, dto.getCid());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "회원수정성공":"회원수정실패(id("+dto.getCid()+")가없음)");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원수정 실패 : " + dto);
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
