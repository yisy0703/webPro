package com.lec.ex6preparedStatement;
import java.sql.*;
import java.util.Scanner;
// �μ����� �޾� �ش� �μ� ����� ���(���, �̸�, ����̸�, �޿�, �޿����. ��簡 ���»���� CEO)
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













