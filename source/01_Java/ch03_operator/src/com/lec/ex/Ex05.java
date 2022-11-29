package com.lec.ex;
// 삼항연산자 (조건)? (조건이참일경우 취할 값) : (조건이거짓일경우취할값)
public class Ex05 {
	public static void main(String[] args) {
		int h = 100;
		String result; // 짝홀여부결과
		if(h%2 == 0) {
			result = "짝수입니다";
		}else {
			result = "홀수입니다";
		}
		System.out.println("결과는 "+result);
	}
}
