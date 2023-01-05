package com.lec.ex6preparedStatement;
import java.sql.*;
import java.util.Scanner;
// 부서명을 받아 해당 부서 사원을 출력(사번, 이름, 상사이름, 급여, 급여등급. 상사가 없는사람은 CEO)
public class Ex3_selectWhereDname {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner sc = new Scanner(System.in);
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT W.EMPNO, W.ENAME, NVL(M.ENAME, 'CEO') MANAGER, W.SAL, GRADE" + 
				"  FROM EMP W, EMP M, DEPT D, SALGRADE" + 
				"  WHERE W.MGR=M.EMPNO AND W.DEPTNO=D.DEPTNO " + 
				"        AND W.SAL BETWEEN LOSAL AND HISAL" + 
				"        AND DNAME=UPPER(?)";
	}
}













