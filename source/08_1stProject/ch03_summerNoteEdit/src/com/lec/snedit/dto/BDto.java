package com.lec.snedit.dto;

public class BDto {
	private int bno;
	private String btitle;
	private String bcontent;
	private String bfile;
	public BDto() { }
	public BDto(int bno, String btitle, String bcontent, String bfile) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfile = bfile;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	@Override
	public String toString() {
		return "Bdto [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bfile=" + bfile + "]";
	}
}
