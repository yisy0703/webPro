package com.lec.ex7_timer;
import java.util.Timer;
import java.util.TimerTask;
public class TimerTestMain {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("시작");
		Timer timer = new Timer(true); // 프로그램 종료시 timer가 메모리 상주하지 X
		TimerTask task1 = new TimerTaskEx1();  
		TimerTask task2 = new TimerTaskEx2();
		timer.schedule(task1, 2000);      // 2초 후 한번 task1.run() 수행
		timer.schedule(task2, 1000, 500); // 1초후부터 0.5초마다 task2.run()수행
		Thread.sleep(11000);
		System.out.println("끝");
	}
}















