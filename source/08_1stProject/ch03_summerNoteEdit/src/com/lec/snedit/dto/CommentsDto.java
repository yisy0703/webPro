package com.lec.snedit.dto;
import java.sql.Timestamp;
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class CommentsDto {
	private int cno;
	private int bno;
	private String ccontent;
	private String cip;
	private Timestamp crdate;
	public CommentsDto() { }
	public CommentsDto(int cno, int bno, String ccontent, String cip, Timestamp crdate) {
		this.cno = cno;
		this.bno = bno;
		this.ccontent = ccontent;
		this.cip = cip;
		this.crdate = crdate;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCip() {
		return cip;
	}
	public void setCip(String cip) {
		this.cip = cip;
	}
	public Timestamp getCrdate() {
		return crdate;
	}
	public void setCrdate(Timestamp crdate) {
		this.crdate = crdate;
	}
	@Override
	public String toString() {
		return "CommentsDto [cno=" + cno + ", bno=" + bno + ", ccontent=" + ccontent + ", cip=" + cip + ", crdate="
				+ crdate + "]";
	}
}
