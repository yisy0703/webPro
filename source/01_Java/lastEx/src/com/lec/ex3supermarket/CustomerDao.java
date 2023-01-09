package com.lec.ex3supermarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public final static int SUCCESS = 1;
	public final static int FAIL    = 0;
	// dao는 싱글톤으로 구현/ private 생성자에는 driver로드
	private static CustomerDao INSTANCE = new CustomerDao();
	public static CustomerDao getInstance() {
		return INSTANCE;
	}
	private CustomerDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	// 1. 회원가입 :
	public int insertCustomer(CustomerDto dto) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (CID, CTEL, CNAME)" + 
						"  VALUES (CUSTOMER_CID_SEQ.NEXTVAL, ?, ?) ";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCtel());
			pstmt.setString(2, dto.getCname());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;		
	}
	public int insertCustomer(String ctel, String cname) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (CID, CTEL, CNAME)" + 
						"  VALUES (CUSTOMER_CID_SEQ.NEXTVAL, ?, ?) ";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
			pstmt.setString(2, cname);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 2. 폰뒤4자리(풀번호) 검색  : 
	public ArrayList<CustomerDto> ctelGetCustomers(String searchTel){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "";
		return dtos;
	}
	
	// 3. 물품구입 : public int buy(int cid, int price)
	
	// 3번 물품구입 후 구매자 정보 출력 : public CustomerDto getCustomer(int cid)
	
	// 4번 전 levelName들 정보 추출 : public ArrayList<String> getLevelNames()
	
	// 4. 등급별 고객 출력 : public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
	
	// 5. 전체 출력 : public ArrayList<CustomerDto> getCustomers()
	
	// 6. 회원탈퇴 : public int deleteCustomer(String ctel)
	
}
