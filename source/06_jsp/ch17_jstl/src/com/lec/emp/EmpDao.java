package com.lec.emp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class EmpDao {
	// 싱글톤
	private EmpDao() {}
	private static EmpDao instance = new EmpDao();
	public static EmpDao getInstance() {
		return instance;
	}
	// Connection 객체 리턴하는 함수
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// 전체 리스트 
	public ArrayList<EmpDto> getListEmp(){
		ArrayList<EmpDto> emps = new ArrayList<EmpDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM EMP";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int empno          = rs.getInt("empno");
				String ename       = rs.getString("ename");
				String job         = rs.getString("job");
				int mgr            = rs.getInt("mgr"); // mgr이 null이면 0으로 가져옴.
				Timestamp hiredate = rs.getTimestamp("hiredate");
				int sal            = rs.getInt("sal");
				int comm           = rs.getInt("comm");
				int deptno         = rs.getInt("deptno");
				emps.add(new EmpDto(empno, ename, job, mgr, hiredate, sal, comm, deptno));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs   != null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return emps;
	}
	
	// 이름과 job으로 검색한 리스트 public ArrayList<EmpDto> getListEmp(String name, String job)
}











