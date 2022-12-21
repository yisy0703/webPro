package com.lec.ex2_thread;
// 안녕하세요 10번 반복
public class TargetEx01 extends Thread {
	@Override
	public void run() {
		for(int i=0 ; i<10 ; i++) {
			System.out.println(Thread.currentThread().getName() + " 안녕하세요 - " + i );
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) { }
		}
	}
}
