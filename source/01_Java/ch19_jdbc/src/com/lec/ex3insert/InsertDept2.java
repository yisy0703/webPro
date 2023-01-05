package com.lec.ex3insert;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
// 입력받은 부서번호 중복체크후 부서명, 근무지를 입력받아 insert
public class InsertDept2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner sc = new Scanner(System.in);
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			System.out.print("입력할 부서번호는 ?");
			int deptno = sc.nextInt();
			// 중복체크
			String selectQuery = "SELECT COUNT(*) CNT FROM DEPT WHERE DEPTNO="+deptno;
			rs = stmt.executeQuery(selectQuery);
			rs.next();
			int cnt = rs.getInt("cnt");
			if(cnt!=0) {
				System.out.println("중복된 부서번호는 입력 불가합니다");
			}else {
				System.out.print("입력할 부서명은 ?");
				String dname = sc.next();
				System.out.print("입력할 부서 위치는 ?");
				String loc = sc.next();
				String insertQuery = String.format("INSERT INTO DEPT VALUES (%d, '%s', '%s')", 
																deptno, dname, loc);
				int result = stmt.executeUpdate(insertQuery);
				System.out.println(result>0? "입력성공":"입력실패");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println("중복된 부서번호이거나 길게 입력한 경우 : "+e.getMessage());
		} finally {
			try {
				if(rs!=null)   rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
