package com.lec.ex06_override;
public class Parent {
	public Parent() { // overloading = 중복정의
		System.out.println("매개변수 없는 Parent 생성자");
	}
	public Parent(int i) {
		System.out.println("매개변수 있는 Parent 생성자");
	}
	public void method1() {
		System.out.println("Parent의 method1()함수");
	}
	public void method2() {
		System.out.println("Parent의 method2()함수");
	}
}
