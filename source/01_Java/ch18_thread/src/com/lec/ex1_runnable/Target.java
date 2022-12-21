package com.lec.ex1_runnable;

public class Target implements Runnable{
	@Override
	public void run() { // 멀티쓰레드에서 하고자 하는 작업 구현
		System.out.println(Thread.currentThread().getName()); // 현재 쓰레드 이름
		for(int i=0 ; i<10 ; i++) {
			System.out.println(Thread.currentThread().getName() +"의 i : " + i);
			try {
				Thread.sleep(500);// 0.5초동안 현 쓰레드를 대기 상태
			} catch (InterruptedException e) { } 
		}
	}
}
