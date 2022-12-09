package com.lec.ex05_testinterface;
public class TestMain {
	public static void main(String[] args) {
		TestChildClass obj = new TestChildClass();
		System.out.println(obj.i1); // static 변수는 클래스이름으로 접근 추천
		System.out.println(TestChildClass.i1);
		obj.m1();
		obj.m2();
		obj.m3();
		obj.m11();
		TestClass obj1 = obj;
//		obj1.m11();
	}
}
