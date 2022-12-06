package com.lec.ex01_parentChild;

public class ParentClass {
	String pStr="부모클래스";
	public ParentClass() {
		System.out.println("부모클래스(=Parent클래스=Super클래스) 생성자 함수");
	}
	public void getPapaName() {
		System.out.println("아빠 이름 : 홍길동");
	}
	public void getMamiName() {
		System.out.println("엄마 이름 : 김길순");
	}
}
