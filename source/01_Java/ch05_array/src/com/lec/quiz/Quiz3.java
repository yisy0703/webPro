package com.lec.quiz;

public class Quiz3 {
	public static void main(String[] args) {
		int money = 2680;
		int[] coinUnit = {500,100,50,10};
		System.out.println(money+"원은");
		// 일반 for문 이용
		for(int i=0 ; i<coinUnit.length ; i++) {
			System.out.print(coinUnit[i] + "원짜리 동전 " + (money/coinUnit[i]) + "개\t");
			money %= coinUnit[i]; // money = money % coinUnit[i];
		}
		// 확장 for문
//		for(int coin : coinUnit) {
//			System.out.print(coin + "원짜리 동전 " + (money/coin) + "개\t");
//			money %= coin;
//		}
	}
}
