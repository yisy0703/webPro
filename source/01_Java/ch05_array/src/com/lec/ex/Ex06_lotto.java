package com.lec.ex;
// 0 <= Math.random() < 1 : 실수
// 0 <= Math.random()*45 < 45 : 실수
// 1 <= (int)(Math.random()*45+1) < 46 : 1~45까지의 정수
public class Ex06_lotto {
	public static void main(String[] args) {
		int[] lotto = new int[6];
		for(int idx=0 ; idx<lotto.length ; idx++) {
			lotto[idx] = (int)(Math.random()*45+1);
		}
		// 발생된 로또 번호 출력
		for(int l : lotto) {
			System.out.print(l + "\t");
		}
	}
}
