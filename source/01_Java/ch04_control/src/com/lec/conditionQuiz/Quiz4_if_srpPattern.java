package com.lec.conditionQuiz;
import java.util.Scanner;
public class Quiz4_if_srpPattern {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int you, computer;
		computer = (int)(Math.random()*3);
		System.out.println("����(0),����(1),��(2) �� �ϳ��� �����ϼ��� : ");
		you = scanner.nextInt(); // 0,1,2
		if(you == 0) {
			System.out.print("����� ����\t��ǻ�ʹ� ");
		}else if(you == 1) {
			System.out.print("����� ����\t��ǻ�ʹ� ");
		}else if(you == 2) {
			System.out.print("����� ���ڱ�\t��ǻ�ʹ� ");
		}else {
			System.out.print("��� �߸� �¾��. ������ �� ����");
			you = 3;
		}
		if(you!=3) {
			String msg = (computer==0) ? "����" : (computer==1)?"����":"���ڱ�";
			System.out.println(msg);
			if( (you+2)%3 == computer ) {
				System.out.println("����� �̰���!!");
			}else if((you+1)%3 == computer){
				System.out.println("��ǻ�Ͱ� �̰���. �޷�");
			}else {
				System.out.println("�����.");
			}
		}
		scanner.close();
	}
}
