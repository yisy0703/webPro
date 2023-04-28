package com.tj.test06.dto;

public class Category {
	private String cno;
	private String main;
	private String sub;
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	@Override
	public String toString() {
		return "Category [cno=" + cno + ", main=" + main + ", sub=" + sub + "]";
	}
}
