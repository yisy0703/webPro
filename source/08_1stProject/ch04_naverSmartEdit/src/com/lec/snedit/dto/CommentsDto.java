package com.lec.snedit.dto;
import java.sql.Timestamp;

public class CommentsDto {
	private int cno;
	private int bno;
	private String ccontent;
	private String cip;
	private Timestamp cdate;
	public CommentsDto() { }
	public CommentsDto(int cno, int bno, String ccontent, String cip, Timestamp cdate) {
		this.cno = cno;
		this.bno = bno;
		this.ccontent = ccontent;
		this.cip = cip;
		this.cdate = cdate;
	}
	public int getCno() {
		return cno;
	}
	public int getBno() {
		return bno;
	}
	public String getCcontent() {
		return ccontent;
	}
	public String getCip() {
		return cip;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	@Override
	public String toString() {
		return "CommentsDto [cno=" + cno + ", bno=" + bno + ", ccontent=" + ccontent + ", cip=" + cip + ", cdate="
				+ cdate + "]";
	}
}
