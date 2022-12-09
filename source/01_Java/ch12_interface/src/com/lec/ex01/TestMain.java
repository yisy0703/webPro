package com.lec.ex01;

public class TestMain {
	public static void main(String[] args) {
//		InterfaceEx1 ex1 = new InterfaceEx1();
		InterfaceClass obj = new InterfaceClass();
		obj.method1();
		System.out.println(obj.method2());
		InterfaceEx1 obj1 = new InterfaceClass();
		obj1.method1();
		//obj1.method2();
		InterfaceEx2 obj2 = new InterfaceClass();
		//obj2.method1();
		obj2.method2();
		System.out.println("상수 CONSTANT_NUM : " + InterfaceEx1.CONSTANT_NUM);
		System.out.println("상수 CONSTANT_NUM : " + InterfaceClass.CONSTANT_NUM);
		System.out.println("상수 CONSTANT_NUM : " + obj.CONSTANT_NUM); // static은 class 접근 추천
		System.out.println("상수 CONSTANT_STRING: " + InterfaceEx2.CONSTANT_STRING);
		System.out.println("상수 CONSTANT_STRING: " + InterfaceClass.CONSTANT_STRING);
	}
}











