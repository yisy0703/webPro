package com.lec.ex8_super;
// private(name, character) public(intro())
public class Baby extends Person{
	public Baby() {
		System.out.println("�Ű����� ����  Baby ������");
	}
	public Baby(String name, String character) {
		setName(name);
		setCharacter(character);
		System.out.println("�Ű����� �ִ� Baby ������");
	}
}
