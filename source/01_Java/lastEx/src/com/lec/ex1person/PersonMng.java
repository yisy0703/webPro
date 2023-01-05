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
		System.out.println(jobs);
		do {
			System.out.print("1:�Է� || 2:��������ȸ || 3:��ü��ȸ || �׿�:����");
			fn = sc.next();
			switch(fn) {
			case "1" : // �̸�, ������(jobs), ��,��, �� �޾� insert
				sql = "INSERT INTO PERSON " + 
						"    VALUES (PERSON_NO_SQ.NEXTVAL, ?, "
						+ "(SELECT JNO FROM JOB WHERE JNAME=?), " + 
						"            ?, ?, ?)";
				try {
					// 1�ܰ� ����̹��ε�� �ѹ��� �ϸ� ��(������ ����)
					// 2~6�ܰ�
				} catch (Exception e) {
					// TODO: handle exception
				} finally {
					// 7�ܰ� close
				}
				break;
			case "2": // ������޾� ���� ���
				sql = "";
				try {
					// 2~6�ܰ�
				} catch (Exception e) {
					// TODO: handle exception
				} finally {
					// 7�ܰ� close
				}
				break;
			case "3":
				sql = "";
				try {
					// 2~6�ܰ�
				} catch (Exception e) {
					// TODO: handle exception
				} finally {
					// 7�ܰ� close
				}
				break;
			}
		}while(fn.equals("1") || fn.equals("2") || fn.equals("3"));
		System.out.println("BYE");
	}
}












