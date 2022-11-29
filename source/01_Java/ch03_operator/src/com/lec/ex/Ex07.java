package com.lec.ex;
// 비트연산자 &(and), |(or), ^(XOR;서로다른값을때만 1)
public class Ex07 {
	public static void main(String[] args) {
		int n1 = 10; // 0 ~ 0 1 0 1 0
		int n2 = 6;  // 0 ~ 0 0 1 1 0
		// -----------------------------
		//        &  : 0 ~  0 0 0 1 0 => 2
		//        |  : 0 ~  0 1 1 1 0 => 14
		//        ^  : 0 ~  0 1 1 0 0 => 12
		System.out.println("n1 & n2는 " + (n1&n2));
		System.out.println("n1 | n2는 " + (n1|n2));
		System.out.println("n1 ^ n2는 " + (n1^n2));
	}
}
