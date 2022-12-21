package com.lec.ex2_thread;

public class Ex01_ThreadExTestMain {
	public static void main(String[] args) {
		// "★ A"라는 이름의 쓰레드 생성 - t1.run()동시에 수행할 쓰레드
		Thread t1 = new ThreadEx();
		t1.setName("★ A");
		// "~B"라는 이름의 쓰레드 생성  - t2.run() 동시에 수행할 쓰레드
		Thread t2 = new ThreadEx("B");
		t1.start();
		t2.start();
		System.out.println("main 함수 쓰레드명 : " + Thread.currentThread().getName());
		System.out.println("main함수 끝");
	}
}
