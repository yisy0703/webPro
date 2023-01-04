package com.lec.ex1selectAll;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
public class SelectAllMySQL {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/kimdb?serverTimezone=UTC";
		Connection conn = null; // db 연결 객체
		Statement  stmt = null; // sql 전송할 객체
		ResultSet  rs   = null; // select 전공 결과를 받을 객체
		String sql = "SELECT * FROM PERSONAL";
		try {
			Class.forName(driver); // 1단계 드라이버로드
			conn = DriverManager.getConnection(url, "root", "mysql"); // 2단계 DB연결객체 생성
			stmt = conn.createStatement(); // 3단계 SQL전송 객체
			rs   = stmt.executeQuery(sql); // 4단계SQL전송 + 5단계 SQL결과 받기
			// 6단계 결과받아 원하는 로직 수행
			while(rs.next()) {
				int    pno     = rs.getInt("pno");
				String pname   = rs.getString("pname"); // pname 타이틀의 필드 값
				String job     = rs.getString(3);  // 3번째 필드 값
				int manager    = rs.getInt("manager"); // null값은 0
				Date startdate = rs.getDate("startdate");
				//String startdate = rs.getString("startdate");
				Timestamp startdate1 = rs.getTimestamp("startdate");// 0시0분0초
				int pay   = rs.getInt("pay");
				int bonus = rs.getInt("bonus");
				int dno   = rs.getInt("dno");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}











