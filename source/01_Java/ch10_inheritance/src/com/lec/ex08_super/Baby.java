package com.lec.ex08_super;
// private(name, character) public(intro())
public class Baby extends Person{
	public Baby() {
		super(); // == Person()
		System.out.println("매개변수 없는  Baby 생성자");
	}
	public Baby(String name, String character) {
		super(name, character); // ==Person(name, character);
//		setName(name);
//		setCharacter(character);
		System.out.println("매개변수 있는 Baby 생성자");
	}
	@Override
	public void intro() {
		System.out.print("☆ 이쁜 아기 ");
		super.intro(); // 부모클래스의 intro()
	}
}
