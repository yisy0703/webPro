package com.lec.quiz;

public class Quiz3 {
	public static void main(String[] args) {
		int money = 2680;
		int[] coinUnit = {500,100,50,10};
		System.out.println(money+"����");
		// �Ϲ� for�� �̿�
		for(int i=0 ; i<coinUnit.length ; i++) {
			System.out.print(coinUnit[i] + "��¥�� ���� " + (money/coinUnit[i]) + "��\t");
			money %= coinUnit[i]; // money = money % coinUnit[i];
		}
		// Ȯ�� for��
//		for(int coin : coinUnit) {
//			System.out.print(coin + "��¥�� ���� " + (money/coin) + "��\t");
//			money %= coin;
//		}
	}
}
