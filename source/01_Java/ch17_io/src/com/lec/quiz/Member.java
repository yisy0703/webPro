package com.lec.quiz;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Member {
	private String name;
	private String tel;
	private Date birthday;
	private String address;
	public Member() { }
	public Member(String name, String tel, Date birthday, String address) {
		this.name = name;
		this.tel = tel;
		this.birthday = birthday;
		this.address = address;
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		return name + "\t" + tel + "\t" + sdf.format(birthday) + "»ý\t" + address+"\n";
	}
}
