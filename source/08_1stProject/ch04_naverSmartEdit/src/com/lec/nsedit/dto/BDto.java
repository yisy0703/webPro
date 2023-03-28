package com.lec.nsedit.dto;

public class BDto {
	private int bno;
	private String btitle;
	private String bcontent;
	private String bfile;
	private int cnt;
	public BDto() { }
	public BDto(int bno, String btitle, String bcontent, String bfile, int cnt) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfile = bfile;
		this.cnt = cnt;
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
	public int getCnt() {
		return cnt;
	}
	@Override
	public String toString() {
		return "Bdto [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bfile=" + bfile + "]";
	}
}
