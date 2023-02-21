package com.lec.friend;

public class FriendDto {
	private int no;
	private String name;
	private String tel;
	public FriendDto() { }
	public FriendDto(int no, String name, String tel) {
		this.no = no;
		this.name = name;
		this.tel = tel;
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
	@Override
	public String toString() {
		return "FriendDto [no=" + no + ", name=" + name + ", tel=" + tel + "]";
	}
}
