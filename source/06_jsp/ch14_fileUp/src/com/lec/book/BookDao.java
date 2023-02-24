package com.lec.book;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDao {
	public static final int SUCCESS = 1;
	public static final int FAIL    = 0;
	//싱글톤
	private static BookDao instance;
	public static BookDao getInstance() {
		if(instance==null) {
			instance = new BookDao();
		}
		return instance;
	}
	private BookDao() {}
	// 커넥션 풀에서 conn 객체 가져와 반환
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
	// 책등록
	
	// 책 리스트(paging없이)
	
	// 책 리스트(paging때 사용 - TOP-N 구문 query 사용)
	
	// 등록된 책 갯수
	
	// bid로 책정보 가져오기
}
















