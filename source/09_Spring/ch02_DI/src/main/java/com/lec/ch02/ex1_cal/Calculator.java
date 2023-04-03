package com.lec.ch02.ex1_cal;

public class Calculator {
	public void addition(int n1, int n2) {
		System.out.print("더하기\t");
		System.out.println(n1 + "+" + n2 + "=" +(n1+n2));
	}
	public void subtraction(int n1, int n2) {
		System.out.print("빼기\t");
		System.out.println(n1 + "-" + n2 + "=" +(n1-n2));
	}
	public void multiplication(int n1, int n2) {
		System.out.print("곱하기\t");
		System.out.println(n1 + "*" + n2 + "=" +(n1*n2));
	}
	public void division(int n1, int n2) {
		System.out.print("나누기\t");
		System.out.println(n1 + "/" + n2 + "=" +(n1/n2));
	}
}