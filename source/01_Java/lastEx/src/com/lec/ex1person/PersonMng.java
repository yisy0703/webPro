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
		PreparedStatement pstmt = null; // 1, 2번 기능
		Statement         stmt  = null; // 3번 기능, 직업명들(jobs)
		ResultSet         rs    = null;
		Scanner           sc    = new Scanner(System.in);
		String fn, sql;
		ArrayList<String> jobs = new ArrayList<String>(); // 직업명들 저장
		// 직업명들을 jobs에 add
		try {
			sql = "SELECT JNAME FROM JOB";
			Class.forName(driver); // (1)드라이버 로드
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
		}// 직업명 가져오기
		//System.out.println(jobs);
		do {
			System.out.print("1:입력 || 2:직업별조회 || 3:전체조회 || 그외:종료");
			fn = sc.next();
			switch(fn) {
			case "1" : // 이름, 직업명(jobs), 국,영, 수 받아 insert
				sql = "INSERT INTO PERSON " + 
						"    VALUES (PERSON_PNO_SQ.NEXTVAL, ?, "
						+ "(SELECT JNO FROM JOB WHERE JNAME=?), " + 
						"            ?, ?, ?)";
				try {
					// 1단계 드라이버로드는 한번만 하면 됨(위에서 했음). 2~6단계
					conn = DriverManager.getConnection(url, "scott", "tiger");//(2)
					pstmt = conn.prepareStatement(sql);//(3)
					System.out.print("입력할 이름은?");
					pstmt.setString(1, sc.next());
					System.out.print("직업"+jobs+"은? ");
					pstmt.setString(2, sc.next());
					System.out.print("국어는 ?");
					pstmt.setInt(3, sc.nextInt());
					System.out.print("영어는 ?");
					pstmt.setInt(4, sc.nextInt());
					System.out.print("수학는 ?");
					pstmt.setInt(5, sc.nextInt());
					int result = pstmt.executeUpdate(); // (4)+(5)
					System.out.println(result>0 ? "입력성공":"입력실패"); // (6)
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					// 7단계 close
					try {
						if(pstmt!=null) pstmt.close();
						if(conn !=null) conn.close();
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					}
				}
				break;
			case "2": // 직업명받아 직업 출력
				sql = "SELECT ROWNUM RANK, A.*" + 
						"  FROM (SELECT PNAME||'('||PNO||')' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM" + 
						"            FROM PERSON P, JOB J" + 
						"            WHERE P.JNO=J.JNO AND JNAME=?" + 
						"            ORDER BY SUM DESC) A";
				try {
				// 2~6단계
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
					// 2~6단계
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