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
		String sql = "SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, " + 
		"   (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp" + 
		"  FROM CUSTOMER C, CUS_LEVEL L" + 
		"  WHERE C.LEVELNO=L.LEVELNO AND CTEL LIKE '%'||?";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTel);
			rs = pstmt.executeQuery();
			while(rs.next()) {
//				int    cid       = rs.getInt("cid");
//				String ctel      = rs.getString("ctel");
//				String cname     = rs.getString("cname");
//				int    cpoint    = rs.getInt("cpoint");
//				int    camount   = rs.getInt("camount");
//				String levelName = rs.getString("levelName");
//				int    forLevelUp= rs.getInt("forLevelUp");
//				dtos.add(new CustomerDto(cid, ctel, cname, cpoint, camount, levelName, forLevelUp));
				CustomerDto dto = new CustomerDto();
				dto.setCid(rs.getInt("cid"));
				dto.setCtel(rs.getString("ctel"));
				dto.setCname(rs.getString("cname"));
				dto.setCpoint(rs.getInt("cpoint"));
				dto.setCamount(rs.getInt("camount"));
				dto.setLevelName(rs.getString("levelName"));
				dto.setForLevelUp(rs.getInt("forLevelUp"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//close
		}//try문
		return dtos;
	}
	// 3. 물품구입 : 
	public int buy(int cid, int price) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER " + 
				"      SET CPOINT = CPOINT + (?*0.05)," + 
				"          CAMOUNT = CAMOUNT + ?," + 
				"          LEVELNO = (SELECT L.LEVELNO" + 
				"                      FROM CUSTOMER, CUS_LEVEL L" + 
				"                      WHERE CAMOUNT+? BETWEEN LOW AND HIGH " + 
				"                            AND CID=?)" + 
				"      WHERE CID = ?";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, price);
			pstmt.setInt(3, price);
			pstmt.setInt(4, cid);
			pstmt.setInt(5, cid);
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
	// 3번 물품구입 후 구매자 정보 출력 : 
	public CustomerDto getCustomer(int cid) {
		CustomerDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME," + 
			"  (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp" + 
			"  FROM CUSTOMER C, CUS_LEVEL L" + 
			"  WHERE C.LEVELNO=L.LEVELNO AND CID = ?";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) { // 검색결과가 있을 경우(cid가 있을 경우), dto에 CustomerDto객체 생성하여 할당
				//int    cid       = rs.getInt("cid");
				String ctel      = rs.getString("ctel");
				String cname     = rs.getString("cname");
				int    cpoint    = rs.getInt("cpoint");
				int    camount   = rs.getInt("camount");
				String levelName = rs.getString("levelName");
				int    forLevelUp= rs.getInt("forLevelUp");
				dto = new CustomerDto(cid, ctel, cname, cpoint, camount, levelName, forLevelUp);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//close
		}//try문
		return dto;
	}
	// 4번 전 levelName들 정보 추출 
	public ArrayList<String> getLevelNames(){
		ArrayList<String> levelNames = new ArrayList<String>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT LEVELNAME FROM CUS_LEVEL";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				levelNames.add(rs.getString("levelName"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//close
		}//try문
		return levelNames;
	}
	// 4. 등급별 고객 출력 
	public ArrayList<CustomerDto> levelNameGetCustomers(String levelName){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, " + 
		"   (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID) forLevelUp" + 
		"  FROM CUSTOMER C, CUS_LEVEL L" + 
		"  WHERE C.LEVELNO=L.LEVELNO AND LEVELNAME=UPPER(?)" + 
		"  ORDER BY CAMOUNT DESC";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, levelName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
//				int    cid       = rs.getInt("cid");
//				String ctel      = rs.getString("ctel");
//				String cname     = rs.getString("cname");
//				int    cpoint    = rs.getInt("cpoint");
//				int    camount   = rs.getInt("camount");
//				String levelName = rs.getString("levelName");
//				int    forLevelUp= rs.getInt("forLevelUp");
//				dtos.add(new CustomerDto(cid, ctel, cname, cpoint, camount, levelName, forLevelUp));
				CustomerDto dto = new CustomerDto();
				dto.setCid(rs.getInt("cid"));
				dto.setCtel(rs.getString("ctel"));
				dto.setCname(rs.getString("cname"));
				dto.setCpoint(rs.getInt("cpoint"));
				dto.setCamount(rs.getInt("camount"));
				dto.setLevelName(rs.getString("levelName"));
				dto.setForLevelUp(rs.getInt("forLevelUp"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//close
		}//try문
		return dtos;
	}
	// 5. 전체 출력 : 
	public ArrayList<CustomerDto> getCustomers(){
		ArrayList<CustomerDto> dtos = new ArrayList<CustomerDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, " + 
			"     (SELECT HIGH+1-CAMOUNT FROM CUSTOMER WHERE LEVELNO!=5 AND CID=C.CID)  forLevelUp" + 
			"  FROM CUSTOMER C, CUS_LEVEL L" + 
			"  WHERE C.LEVELNO=L.LEVELNO " + 
			"  ORDER BY CAMOUNT DESC";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int    cid       = rs.getInt("cid");
				String ctel      = rs.getString("ctel");
				String cname     = rs.getString("cname");
				int    cpoint    = rs.getInt("cpoint");
				int    camount   = rs.getInt("camount");
				String levelName = rs.getString("levelName");
				int    forLevelUp= rs.getInt("forLevelUp");
				dtos.add(new CustomerDto(cid, ctel, cname, cpoint, camount, levelName, forLevelUp));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}//close
		}//try문
		return dtos;
	}
	// 6. 회원탈퇴 : 
	public int deleteCustomer(String ctel) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM CUSTOMER WHERE CTEL=?";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctel);
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
}