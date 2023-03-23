package com.lec.camp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.camp.dto.ReservationDto;

public class ReservationDao {
	private DataSource ds;
	// 싱글톤
	private static ReservationDao instance = new ReservationDao();
	public static ReservationDao getInstance() {
		return instance;
	}
	// 생성자에서 ds 할당
	private ReservationDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	//  3. 해당 년월에 예약되었는지 파악
	public int getReservation(int cno, String reservationDate){
		int reserved = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM RESERVATION WHERE CNO=? AND ReservationDATE=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setString(2, reservationDate);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reserved = 1;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return reserved;
	}
	//  4 . 캠핑장 예약하기
	public int reservationCamp(String mid, int cno, String reservationDate){
		int result = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO RESERVATION (RNO, MID, CNO, ReservationDATE, DAY)" + 
				"  VALUES (RESERVATION_SEQ.NEXTVAL, ?, ?, " + 
				"        to_date(?, 'yyyy-mm-dd'), to_char(to_date(?, 'yyyy-mm-dd'),'dd'))";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, cno);
			pstmt.setString(3, reservationDate);
			pstmt.setString(4, reservationDate);
			result = pstmt.executeUpdate();
			System.out.println(result==1? reservationDate + "메뉴 입력 성공": reservationDate + "메뉴 입력 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return result;
	}
	//  -- 5. 해당 년월에 예약된 내용들 보기
	public ArrayList<ReservationDto> getReservation(String yearStr, String monthStr){
		ArrayList<ReservationDto> dtos = new ArrayList<ReservationDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM RESERVATION" + 
				"  WHERE CNO=1 AND TO_CHAR(ReservationDATE, 'YYYY-MM') = ?|| '-' || ?" + 
				"  ORDER BY DAY";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, yearStr);
			pstmt.setString(2, monthStr);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String mid = rs.getString("mid");
				int cno = rs.getInt("cno");
				Date reservationDate = rs.getDate("reservationDate"); // 예약 날짜
				Date registrationDate = rs.getDate("registrationDate"); // 예약 등록일
				int day = rs.getInt("day");
				dtos.add(new ReservationDto(rno, mid, cno, reservationDate, registrationDate, day));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return dtos;
	}
}
