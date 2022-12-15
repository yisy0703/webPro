package com.lec.quiz;
import java.util.Random;
import java.util.Scanner;
public class RockPaperScissors {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Random  random  = new Random();
		int you, computer;
		final int SCISSOR = 0;
		final int ROCK    = 1;
		final int PAPER   = 3;
		final int NOTHING = 4;
		do{
			computer = random.nextInt(3);
			System.out.print("����,����,��(����� �̱�� �����ϴ�) �� ");
			String youStr = scanner.next().trim(); // "  ����  "�� �Է��ص� "����"��
			if(youStr.equals("����")) {
				you = SCISSOR;
			}else if(youStr.equals("����")) {
				you = ROCK;
			}else if(youStr.equals("��")) {
				you = PAPER;
			}else {
				you = NOTHING;// ������������ �ƴ� �ٸ� ���� �Է��� ���
				continue;
			}
			if ((you + 2) % 3 == computer) {
				printResult(you, computer);
				System.out.println("����� �̰���");
			}else if (you == computer) {
				printResult(you, computer);
				System.out.println("�����");
			} else {
				printResult(you, computer);
				System.out.println("����� �����");
			} // if
		}while(you==NOTHING || (you + 2) % 3 != computer); 
		System.out.println("�����ؿ�. BYE");
		scanner.close();
	}
	private static void printResult(int me, int computer) {
		System.out.println("����� "+((me==0)?"����":((me==1)?"����":"��")));
		System.out.println("��ǻ�ʹ� "+((computer==0)?"����":((computer==1)?"����":"��")));		
	} // printResult
}