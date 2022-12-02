package com.lec.ex;
// 1~10까지 정수의 합과 그 결과가 짝수인지 홀수인지 출력
public class Ex02 {
	private static int sum(int from, int to) {
		int sum = 0; // 누적할 변수
		for(int i=from ; i<=to ; i++) {
			sum += i;
		}
		return sum;
	}	
	private static String evenOdd(int value) {
		String result = value%2==0 ? "짝수입니다":"홀수입니다";
		return result;
	}
	public static void main(String[] args) {
		int tot = sum(1, 10);
		System.out.println("1~10까지 정수의 합은 " + tot);
		System.out.println( evenOdd(tot) );
		// --------------------------------------------------
		tot = sum(10, 100);
		System.out.println("10~100까지 정수의 합은 " + tot);
		System.out.println( evenOdd(tot) );
	}
}





