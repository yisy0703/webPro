package com.lec.ex2_throws;
public class ThrowsEx {
	public ThrowsEx() {
		actionC();
	}
	private void actionC() {
		System.out.println("actionC ���ݺ�");
		actionB();
		System.out.println("actionC �Ĺݺ�");
	}
	private void actionB() {
		System.out.println("actionB ���ݺ�");
		actionA();
		System.out.println("actionB �Ĺݺ�");
	}
	private void actionA() {
		System.out.println("actionA ���ݺ�");
		int[] arr = {0,1,2};
		System.out.println(arr[3]);
		System.out.println("actionA �Ĺݺ�");
	}
}










