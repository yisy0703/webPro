package com.lec.ex2_throws;
public class ThrowsEx {
	public ThrowsEx() {
		actionC();
	}
	private void actionC() {
		System.out.println("actionC 전반부");
		actionB();
		System.out.println("actionC 후반부");
	}
	private void actionB() {
		System.out.println("actionB 전반부");
		actionA();
		System.out.println("actionB 후반부");
	}
	private void actionA() {
		System.out.println("actionA 전반부");
		int[] arr = {0,1,2};
		System.out.println(arr[3]);
		System.out.println("actionA 후반부");
	}
}










