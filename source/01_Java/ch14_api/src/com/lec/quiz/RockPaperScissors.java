package com.lec.quiz;

import java.util.Scanner;

public class RockPaperScissors {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int you, computer;
		do{
			System.out.println("����,����,�� �� �ϳ��� �����ϼ���(����� �̱�� �����ϴ�)");
		}wihle();
	}
	private static void printResult(int me, int computer) {
		System.out.println("����� "+((me==0)?"����":((me==1)?"����":"��")));
		System.out.println("��ǻ�ʹ� "+((computer==0)?"����":((computer==1)?"����":"��")));		
	} // printResult

}
