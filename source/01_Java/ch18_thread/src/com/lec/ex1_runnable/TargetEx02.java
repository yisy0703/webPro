package com.lec.ex1_runnable;
public class TargetEx02 implements Runnable {
	@Override
	public void run() {
		for(int i=0 ; i<20 ; i++) {
			System.out.println(" ~~~ ¹Ý°©½À´Ï´Ù. ~~~~" + i + Thread.currentThread().getName());
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) { }
		}//for
	} // run
}
