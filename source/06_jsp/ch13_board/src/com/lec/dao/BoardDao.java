package com.lec.dao;

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

import com.lec.dto.BoardDto;

public class BoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL    = 0;
	// 싱글톤
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	private BoardDao() {}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
//	-- 1. 글갯수 : SELECT COUNT(*) FROM BOARD;
	public int getBoardTotalCnt() {
		int totalCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1); // 1열의 데이터를 int값으로 받아옴
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return totalCnt;
	}
//	-- 2. 글목록 : 	SELECT * FROM BOARD ORDER BY REF DESC;
	public ArrayList<BoardDto> listBoard(){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM BOARD ORDER BY REF DESC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num         = rs.getInt("num");
				String writer   = rs.getString("writer");
				String subject  = rs.getString("subject");
				String content  = rs.getString("content");
				String email    = rs.getString("email");
				int    readcount= rs.getInt("readcount");
				String pw       = rs.getString("pw");
				int    ref      = rs.getInt("ref");
				int    re_step  = rs.getInt("re_step");
				int    re_indent= rs.getInt("re_indent");
				String ip       = rs.getString("ip");
				Timestamp rdate = rs.getTimestamp("rdate");
				dtos.add(new BoardDto(num, writer, subject, content, email, readcount, 
						pw, ref, re_step, re_indent, ip, rdate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
//	-- 3. 글쓰기(원글쓰기) : INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, 
//	                    PW, REF, RE_STEP, RE_INDENT, IP)
//	  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), '홍길동', '제목1', '본문\n방가', null,
//	                    '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.0.1' );
	public int insertBoard(BoardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, " + 
				"	                    PW, REF, RE_STEP, RE_INDENT, IP)" + 
				"	  VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM BOARD), ?, ?, ?, ?," + 
				"	                    ?, (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, ?)";
		return result;
	}
//	-- 4. 글번호로 글상세보기 내용(DTO) 가져오기 : SELECT * FROM BOARD WHERE NUM=2;
//
//	-- 5. 조회수 올리기 : UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM=2;
//
//	-- 6. 글 수정 : UPDATE BOARD SET SUBJECT = '수정된제목1',
//	                CONTENT = '수정된 본문\n방가',
//	                EMAIL = 'hong@hong.com',
//	                PW ='111',
//	                IP='127.0.0.1'
//	            WHERE NUM=1;
//
//	-- 7. 글삭제(비밀번호를 맞게 입력한 경우만 삭제): DELETE FROM BOARD WHERE NUM=1 AND PW='111';
}
