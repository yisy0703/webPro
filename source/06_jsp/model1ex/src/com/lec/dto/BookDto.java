package com.lec.dto;

import java.sql.Date;

public class BookDto {
	private int bid;
	private String btitle;
	private int    bprice;
	private String bimage1;
	private String bimage2;
	private String bcontent;
	private int    bdiscount;
	private Date   brdate;
	// 생성자 & getter & setter & toString
	public BookDto() { }
	public BookDto(int bid, String btitle, int bprice, String bimage1, String bimage2, String bcontent, int bdiscount,
			Date brdate) {
		this.bid = bid;
		this.btitle = btitle;
		this.bprice = bprice;
		this.bimage1 = bimage1;
		this.bimage2 = bimage2;
		this.bcontent = bcontent;
		this.bdiscount = bdiscount;
		this.brdate = brdate;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public String getBimage1() {
		return bimage1;
	}
	public void setBimage1(String bimage1) {
		this.bimage1 = bimage1;
	}
	public String getBimage2() {
		return bimage2;
	}
	public void setBimage2(String bimage2) {
		this.bimage2 = bimage2;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBdiscount() {
		return bdiscount;
	}
	public void setBdiscount(int bdiscount) {
		this.bdiscount = bdiscount;
	}
	public Date getBrdate() {
		return brdate;
	}
	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}
	@Override
	public String toString() {
		return "BookDto [bid=" + bid + ", btitle=" + btitle + ", bprice=" + bprice + ", bimage1=" + bimage1
				+ ", bimage2=" + bimage2 + ", bcontent=" + bcontent + ", bdiscount=" + bdiscount + ", brdate=" + brdate
				+ "]";
	}
}
