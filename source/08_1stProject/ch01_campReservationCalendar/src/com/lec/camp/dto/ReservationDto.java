package com.lec.camp.dto;

import java.sql.Date;

public class ReservationDto {
	private int rno;
	private String mid;
	private int cno;
	private Date reservationDate; // 예약 날짜
	private Date registrationDate; // 예약 등록일
	private int day;
	public ReservationDto() { }
	public ReservationDto(int rno, String mid, int cno, Date reservationDate, Date registrationDate,
			int day) {
		this.rno = rno;
		this.mid = mid;
		this.cno = cno;
		this.reservationDate = reservationDate;
		this.registrationDate = registrationDate;
		this.day = day;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "ReservationDto [rno=" + rno + ", mid=" + mid + ", cno=" + cno + ", reservationDate=" + reservationDate
				+ ", registrationDate=" + registrationDate + ", day=" + day + "]";
	}
}
