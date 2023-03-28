package com.lec.dto;

public class FriendDto {
	private int no;
	private String name;
	private String tel;
	private String addr;
	public FriendDto() {}
	public FriendDto(int no, String name, String tel, String addr) {
		this.no = no;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "FriendDto [no=" + no + ", name=" + name + ", tel=" + tel + ", addr=" + addr + "]";
	}
}
