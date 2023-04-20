package com.lec.seat.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class TimeReservation {
	private int rno;
	private Date rdate;
	private int rtime;
	@Override
	public String toString() {
		return "{'rdate':'" + rdate +"', 'rtime':"+rtime+"}";
	}
}
