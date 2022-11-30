package com.lec.loopQuiz;
//1~10까지의 곱을 구해보자
public class Quiz1_for {
	public static void main(String[] args) {
		int result = 1;
		for(int i=1 ; i<=10 ; i++) {
			result *= i; // result = result*i
		}
		System.out.println("1~10까지의 곱은 "+result);
	}
}
