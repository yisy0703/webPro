package com.lec.quiz;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Member {
	private String name;
	private String phone;
	private Date birthday;
	private String address;
	public Member() { }
	public Member(String name, String phone, Date birthday, String address) {
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.address = address;
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		return name + "\t" + phone + "\t" + sdf.format(birthday) + "»ý\t" + address +"\n";
	}
}
