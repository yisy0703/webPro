package com.lec.ex09_customer;
public class Person {
	private String name;
	private String tel;  // Person p = new Person("홍길동", "010-9999-9999");
	public Person(String name, String tel) {
		this.name = name;
		this.tel = tel;
	}
	public String infoString() {
		return "[이름]" + name + "   [전화]" + tel;
	}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getTel() {return tel;}
	public void setTel(String tel) {this.tel = tel;}
}
