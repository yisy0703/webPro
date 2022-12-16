package com.lec.ex2_throws;
public class ThrowsEx {
	public ThrowsEx() throws Exception{
		actionC();
	}
	private void actionC() throws IndexOutOfBoundsException{
		System.out.println("actionC 전반부");
		actionB();
		System.out.println("actionC 후반부");
	}
	private void actionB() throws IndexOutOfBoundsException{
		System.out.println("actionB 전반부");
		actionA();
		System.out.println("actionB 후반부");
	}
	private void actionA() throws ArrayIndexOutOfBoundsException{
		System.out.println("actionA 전반부");
		int[] arr = {0,1,2};
		System.out.println(arr[3]);
		System.out.println("actionA 후반부");
	}
}










