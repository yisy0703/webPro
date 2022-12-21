package com.lec.ex2_thread;
// 반갑습니다. 20번 반복
public class TargetEx02 extends  Thread{
	@Override
	public void run() {
		for(int i=0 ; i<20 ; i++) {
			System.out.println(Thread.currentThread().getName() + " 반갑습니다. " + i);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
	}
}
