package com.lec.conditionQuiz;
import java.util.Scanner;
public class Quiz4_if_srp {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int you, computer;
		computer = (int)(Math.random()*3);
		System.out.println("����(0),����(1),��(2) �� �ϳ��� �����ϼ��� : ");
		you = scanner.nextInt(); // 0,1,2
		if(you == 0) {
			System.out.print("����� ����");
		}else if(you == 1) {
			System.out.print("����� ����");
		}else if(you == 2) {
			System.out.print("����� ���ڱ�");
		}else {
			System.out.print("��� �߸� �¾��. ������ �� ����");
			you = 3;
		}
		if(you!=3) {
			if(computer==0) {
				System.out.println("\t��ǻ�ʹ� ����");
			}else if(computer==1) {
				System.out.println("\t��ǻ�ʹ� ����");
			}else if(computer ==2) {
				System.out.println("\t��ǻ�ʹ� ���ڱ�");
			}// if - computer
		}
		if(you == 0) {
			if (computer==0) {
				System.out.println("�����");
			}else if(computer==1) {
				System.out.println("��ǻ�Ͱ� �̰���. �޷�");
			}else {
				System.out.println("����� �̰���!");
			}
		}else if (you == 1) {
			if(computer==0) {
				System.out.println("����� �̰���!!");
			}else if(computer==1) {
				System.out.println("�����.");
			}else {
				System.out.println("��ǻ�Ͱ� �̰���. �޷�");
			}
		}else if (you==2) {
			if(computer==0) {
				System.out.println("��ǻ�Ͱ� �̰���. �޷�");
			}else if(computer==1) {
				System.out.println("����� �̰���!!");
			}else {
				System.out.println("�����");
			}
		} // ���
		scanner.close();
	}// main
}
