package com.lec.quiz;

import java.util.Random;
import java.util.Scanner;

public class RockPaperScissors {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Random  random  = new Random();
		int you, computer;
		do{
			computer = random.nextInt(3);
			System.out.println("����,����,�� �� �ϳ��� �����ϼ���(����� �̱�� �����ϴ�)");
			String youStr = scanner.next().trim();
			if(youStr.equals("����")) {
				you = 0;
			}else if(youStr.equals("����")) {
				you = 1;
			}else if(youStr.equals("��")) {
				you = 2;
			}else {
				you = -1;// ������������ �ƴ� �ٸ� ���� �Է��� ���
				continue;
			}
			
		}while(you==-1 || (you + 2) % 3 != computer); 
		System.out.println("�����ؿ�. BYE");
		scanner.close();
	}
	private static void printResult(int me, int computer) {
		System.out.println("����� "+((me==0)?"����":((me==1)?"����":"��")));
		System.out.println("��ǻ�ʹ� "+((computer==0)?"����":((computer==1)?"����":"��")));		
	} // printResult

}
