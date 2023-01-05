package com.lec.ex6preparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
// 수정할 부서번호를 받아 존재하는 부서번호인지 확인후, 부서명, 근무지 입력받아 update
public class UpdateDept2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner sc = new Scanner(System.in);
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		String selectQuery = "SELECT * FROM DEPT WHERE DEPTNO="+deptno;
		String updateQuery = String.format("UPDATE DEPT SET DNAME='%s', LOC='%s' WHERE DEPTNO=%d",
				dname, loc, deptno);
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			System.out.print("수정할 부서번호는 ?");
			int deptno = sc.nextInt();
			
			rs = stmt.executeQuery(selectQuery);
			if(rs.next()) {//수정 진행
				System.out.print("수정할 부서명은 ?");
				String dname = sc.next();
				System.out.print("수정할 위치는 ?");
				String loc = sc.next();
				
				int result = stmt.executeUpdate(updateQuery);
				if(result>0) {
					System.out.println("수정성공");
				}
			}else {
				System.out.println(deptno+"번 부서는 유효한 부서번호가 아닙니다");
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
