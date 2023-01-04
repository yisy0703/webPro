package com.lec.ex2selectWhere;
import java.sql.*;
import java.util.Scanner;
/*1. ����ڿ��� ���ϴ� �μ���ȣ�� �Է¹޾�
	1-1 �ش� �μ���ȣ�� �����ϴ� ��� : �μ����� ���,
		���(���, �̸�, �޿�, ����)�� ������ ��� ����Ʈ ���, �������� ���� ��� ����� ���ٰ� ���
	1-2 �ش� �μ���ȣ�� �������� ���� ��� : �������� �ʴ� �μ���ȣ��� ��� */ 
public class Ex2_selectWhereDeptno2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner sc = new Scanner(System.in);
		System.out.print("����� ���ϴ� �μ���ȣ�� ? ");
		int deptno = sc.nextInt();
		String query1 = "SELECT * FROM DEPT WHERE DEPTNO="+deptno;
		String query2 = "SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER" + 
				"  FROM EMP W, EMP M" + 
				"  WHERE W.MGR=M.EMPNO AND W.DEPTNO=" +deptno;
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		try {
			Class.forName(driver);//(1)
			conn = DriverManager.getConnection(url, "scott","tiger");//(2)
			stmt = conn.createStatement(); //(3)
			rs = stmt.executeQuery(query1); // (4) + (5)
			if(rs.next()) {
				System.out.println("���ϴ� �μ���ȣ : " + deptno);
				System.out.println("���ϴ� �μ��̸� : " + rs.getString("dname"));
				System.out.println("���ϴ� �μ���ġ : " + rs.getString("loc"));
				rs.close();
				rs = stmt.executeQuery(query2);
				if(rs.next()) {
					System.out.println("���\t�̸�\t�޿�\t����");
					do {
						int empno    = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal      = rs.getInt("sal");
						String manager = rs.getString("manager");
						System.out.println(empno+"\t"+ename+"\t"+sal+"\t"+manager);
					}while(rs.next());
				} else {
					System.out.println(deptno+"�� �μ� ����� �����ϴ�");
				}
			}else {
				System.out.println(deptno +"�� ��ȿ�� �μ���ȣ�� �ƴյ��");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try { //7.��������
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {  }
		}//try-catch-finally
	}
}
