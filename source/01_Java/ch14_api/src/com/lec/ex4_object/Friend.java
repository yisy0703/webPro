package com.lec.ex4_object;
public class Friend {
	private String name;
	private String tel;
	private String birth; // "01-01"
	private String address;
	public Friend() { }
	public Friend(String name, String tel, String birth, String address) {
		this.name = name;
		this.tel = tel;
		this.birth = birth;
		this.address = address;
	}
	@Override
	public String toString() {
		return "[捞抚]"+name + "\t[傈拳]"+tel +"\t[积老]" +birth + "\t[林家]" + address;
	}
	public String getBirth() {
		return birth;
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public String getAddress() {
		return address;
	}
}



