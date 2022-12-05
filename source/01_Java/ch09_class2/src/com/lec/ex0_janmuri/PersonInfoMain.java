package com.lec.ex0_janmuri;
// PersonInfoMain.java => PersonInfoMain 클래스가 public으로 선언되어야 함.
//                          자바파일에는 public 클래스 한개만 구현.
class PersonInfo{
	private String name;
	private int age;
	private char gender;
	public PersonInfo(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	public void print() {
		System.out.println("이름 : " + name +", 나이 : " + age + ", 성별 : " +gender);
	}
}
public class PersonInfoMain {
	public static void main(String[] args) {
		PersonInfo[] person = {new PersonInfo("홍", 25, 'f'),
								new PersonInfo("김", 24, 'm') };
		for(PersonInfo p : person) {
			p.print();
		}
	}
}








