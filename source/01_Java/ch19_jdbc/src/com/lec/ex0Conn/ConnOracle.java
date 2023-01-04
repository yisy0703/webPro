package com.lec.ex0Conn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConnOracle {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		try {
			Class.forName(driver); // 1. 드라이버 로드
			System.out.println("드라이버 로드 성공");
			conn = DriverManager.getConnection(url, "scott", "tiger");//2.DB연결객체
			System.out.println("Oracle 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패 : "+e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
