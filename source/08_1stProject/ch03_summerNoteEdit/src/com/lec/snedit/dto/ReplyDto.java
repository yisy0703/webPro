package com.lec.snedit.dto;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class ReplyDto {
	private int rno;
	private int bno;
	private String rcontent;
	private String rip;
	private Timestamp rdate;
	public ReplyDto() { }
	public ReplyDto(int rno, int bno, String rcontent, String rip, Timestamp rdate) {
		this.rno = rno;
		this.bno = bno;
		this.rcontent = rcontent;
		this.rip = rip;
		this.rdate = rdate;
	}
	public int getRno() {
		return rno;
	}
	public int getBno() {
		return bno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public String getRip() {
		return rip;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	@Override
	public String toString() {
		return "ReplyDto [rno=" + rno + ", bno=" + bno + ", rcontent=" + rcontent + ", rip=" + rip + ", rdate=" + rdate
				+ "]";
	}
}
