package com.lec.ex4_abc;
public class TestMain {
	public static void main(String[] args) {
		S sObj = new S(); // 생성자함수1개 실행
		//A aObj = new A();
		S aObj = new A(); // 생성자함수 2개 실행(부모단+자식단)
		// B bObj = new B();
		S bObj = new B(); // 생성자함수 2개 실행(부모단+자식단)
		C cObj = new C(); // 생성자함수 2개 실행(부모단+자식단)
		//S cObj = new C();
//		S[] arr = {new S(), new A(), new B(), new C()};
		S[] arr = {sObj, aObj, bObj, cObj};
		for(S a : arr) {
			System.out.println("s = " + a.s);
		}
	}
}
