package com.lec.ex4_targetNThreadN;
// target객체는 N개, 쓰레드는 N개 = 쓰레드 하나가 target객체를 공유
public class TargetExTestMain {
	public static void main(String[] args) {
		Runnable targetA = new TargetEx(); // run()함수에 A면 num증가, A가 아니면 num=0
		Runnable targetB = new TargetEx();
		Thread threadA = new Thread(targetA, "A");
		Thread threadB = new Thread(targetB, "B");
		threadA.start();
		threadB.start();
		System.out.println("main 함수 끝");
	}
}
