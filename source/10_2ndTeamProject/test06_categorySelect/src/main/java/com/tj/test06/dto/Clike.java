package com.tj.test06.dto;

public class Clike {
	private int clno;
	private String mid;
	private int cno;
	private String sub;
	public int getClno() {
		return clno;
	}
	public void setClno(int clno) {
		this.clno = clno;
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
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	@Override
	public String toString() {
		return "Clike [clno=" + clno + ", mid=" + mid + ", cno=" + cno + ", sub=" + sub + "]";
	}
}
