package com.lec.ex2selectWhere;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
// 사용자에게 원하는 부서번호를 입력받아 부서정보 출력
public class Ex1_selectWhereDeptno {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		Scanner scanner = new Scanner(System.in);
		System.out.print("원하는 부서번호는 ?");
		int deptno = scanner.nextInt();
		String sql = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if(rs.next()) {
				String dname = rs.getString("dname");
				String loc   = rs.getString("loc");
				System.out.println(deptno + "번 부서정보는 다음과 같습니다");
				System.out.println("부서명 : " + dname);
				System.out.println("부서위치 : " + loc);
			}else {
				System.out.println("해당 부서가 존재하지 않습니다");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try { // 7단계 연결해제
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}














