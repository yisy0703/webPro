package com.lec.ex1_runnable;

public class Target implements Runnable{
	@Override
	public void run() { // ��Ƽ�����忡�� �ϰ��� �ϴ� �۾� ����
		System.out.println(Thread.currentThread().getName()); // ���� ������ �̸�
		for(int i=0 ; i<10 ; i++) {
			System.out.println(Thread.currentThread().getName() +"�� i : " + i);
			try {
				Thread.sleep(500);// 0.5�ʵ��� �� �����带 ��� ����
			} catch (InterruptedException e) { } 
		}
	}
}
