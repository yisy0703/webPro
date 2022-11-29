package com.lec.ex;
// 증감연산자 : ++(1증가), --(1감소)
public class Ex02 {
	public static void main(String[] args) {
		int n1 = 10;
		int n2 = ++n1; // n1을 1 증가하고 n2에 할당
		System.out.printf("n1 = %d, n2 = %d\n", n1, n2);
		n2 = n1++;     // n1값을 n2에 할당한 후 1증가
		System.out.printf("n1 = %d, n2 = %d\n", n1, n2);
		n2 = --n1;
		System.out.printf("n1 = %d, n2 = %d\n", n1, n2);
		n2 = n1--;
		System.out.printf("n1 = %d, n2 = %d\n", n1, n2);
	}
}
