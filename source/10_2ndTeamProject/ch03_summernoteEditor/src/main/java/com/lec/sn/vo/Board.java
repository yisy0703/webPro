package com.lec.sn.vo;
public class Board {
	// 변수의 첫번째나 두번째 글자가 대문자면 lombok을 사용 못 함 
	private int bNo;
	private String bTitle;
	private String bContent;
	private String bFile1;
	private String bFile2;
	private String bFile3;
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbFile1() {
		return bFile1;
	}
	public void setbFile1(String bFile1) {
		this.bFile1 = bFile1;
	}
	public String getbFile2() {
		return bFile2;
	}
	public void setbFile2(String bFile2) {
		this.bFile2 = bFile2;
	}
	public String getbFile3() {
		return bFile3;
	}
	public void setbFile3(String bFile3) {
		this.bFile3 = bFile3;
	}
}
