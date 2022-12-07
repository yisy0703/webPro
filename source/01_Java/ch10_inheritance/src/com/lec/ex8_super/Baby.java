package com.lec.ex8_super;
// private(name, character) public(intro())
public class Baby extends Person{
	public Baby() {
		System.out.println("매개변수 없는  Baby 생성자");
	}
	public Baby(String name, String character) {
		setName(name);
		setCharacter(character);
		System.out.println("매개변수 있는 Baby 생성자");
	}
}
