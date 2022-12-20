package com.lec.quiz;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Friend {
	private String name;
	private String phone;
	private String address;
	private Date   birthday;
	public Friend(String name, String phone, String address, Date birthday) {
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		return "\n�̸� : " + name + "\n�ּ� : " + address + "\n�ڵ��� : " + phone + "\n���� : " + sdf.format(birthday);
	}
	public String getAddress() {return address;}
}
