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
		return "\n이름 : " + name + "\n주소 : " + address + "\n핸드폰 : " + phone + "\n생일 : " + sdf.format(birthday);
	}
	public String getAddress() {return address;}
}
