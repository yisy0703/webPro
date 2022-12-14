package com.lec.ex3_math;
public class Ex01_Math {
	public static void main(String[] args) {
		int a = 2, b = 10;
		System.out.println("a의 b승 : " + (int)Math.pow(a, b));
		System.out.println("-9.9의 절대값 : " + Math.abs(-9.9));
		System.out.println("a와 b중 최소값 : " + Math.min(a, b));
		System.out.println("a와 b중 최대값 : " + Math.max(a, b));
		// Math의 final 변수
		System.out.println("PI = " + Math.PI);
	}
}
