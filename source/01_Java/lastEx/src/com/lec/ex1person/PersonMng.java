package com.lec.ex1person;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class PersonMng {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection        conn = null;
		PreparedStatement pstmt = null; // 1, 2�� ���
		Statement         stmt  = null; // 3�� ���, �������(jobs)
		ResultSet         rs    = null;
		Scanner           sc    = new Scanner(System.in);
		String fn, sql;
		ArrayList<String> jobs = new ArrayList<String>(); // ������� ����
		// ��������� jobs�� add
		try {
			sql = "SELECT JNAME FROM JOB";
			Class.forName(driver); // (1)����̹� �ε�
			conn = DriverManager.getConnection(url, "scott", "tiger");//(2)
			stmt = conn.createStatement();//(3)
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				jobs.add(rs.getString("jname"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs  !=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				
			}
		}// ������ ��������
		//System.out.println(jobs);
		do {
			System.out.print("1:�Է� || 2:��������ȸ || 3:��ü��ȸ || �׿�:����");
			fn = sc.next();
			switch(fn) {
			case "1" : // �̸�, ������(jobs), ��,��, �� �޾� insert
				sql = "INSERT INTO PERSON " + 
						"    VALUES (PERSON_PNO_SQ.NEXTVAL, ?, "
						+ "(SELECT JNO FROM JOB WHERE JNAME=?), " + 
						"            ?, ?, ?)";
				try {
					// 1�ܰ� ����̹��ε�� �ѹ��� �ϸ� ��(������ ����). 2~6�ܰ�
					conn = DriverManager.getConnection(url, "scott", "tiger");//(2)
					pstmt = conn.prepareStatement(sql);//(3)
					System.out.print("�Է��� �̸���?");
					pstmt.setString(1, sc.next());
					System.out.print("����"+jobs+"��? ");
					pstmt.setString(2, sc.next());
					System.out.print("����� ?");
					pstmt.setInt(3, sc.nextInt());
					System.out.print("����� ?");
					pstmt.setInt(4, sc.nextInt());
					System.out.print("���д� ?");
					pstmt.setInt(5, sc.nextInt());
					int result = pstmt.executeUpdate(); // (4)+(5)
					System.out.println(result>0 ? "�Է¼���":"�Է½���"); // (6)
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					// 7�ܰ� close
					try {
						if(pstmt!=null) pstmt.close();
						if(conn !=null) conn.close();
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					}
				}
				break;
			case "2": // ������޾� ���� ���
				sql = "SELECT ROWNUM RANK, A.*" + 
						"  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM" + 
						"            FROM PERSON P, JOB J" + 
						"            WHERE P.JNO=J.JNO AND JNAME=?" + 
						"            ORDER BY SUM DESC) A";
				try {
				// 2~6�ܰ�
					conn = DriverManager.getConnection(url, "scott", "tiger");// (2)
					
				}  catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if(rs   !=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn !=null) conn.close();
					} catch (SQLException e) {
						
					}
				}
				break;
			case "3":
				sql = "SELECT ROWNUM RANK, A.*" + 
						"  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM" + 
						"            FROM PERSON P, JOB J" + 
						"            WHERE P.JNO=J.JNO" + 
						"            ORDER BY SUM DESC) A";
				try {
					// 2~6�ܰ�
					conn = DriverManager.getConnection(url, "scott", "tiger");// (2)
					
				}  catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if(rs   !=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn !=null) conn.close();
					} catch (SQLException e) {
						
					}
				}
				break;
			}
		}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
		System.out.println("BYE");
	}
}