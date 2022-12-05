package com.lec.ex5_personinfo;
// new PersonInfo("홍길동", 20, 'm')
public class PersonInfo {
	private String name;
	private int    age;
	private char   gender; // 'm'또는 'f'
	public PersonInfo() {}
	public PersonInfo(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	public void print() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + (gender=='m'? "남자": (gender=='f'? "여자":"무")));
	}
	public String infoString() {
		//String result = "이름 : " + name + "\n나이 : " + age + "\n성별 : " + ...;
		String result = "이름 : " + name;
		result += "\n나이 : " + age; // result = result + "\n나이 : " + age;
		result += "\n성별 : " + (gender=='m' ? "남자" : (gender=='f'? "여자" : "무"));
		return result;
	}
}














