package com.lec.quiz;
import java.util.Scanner;
public class Quiz {
	public static void main(String[] args) {
		// ����ڷ� ���� 2~9������ ���ϴ� �������� �޴´�.
		Scanner sc = new Scanner(System.in);
		int dansu;
		do {
			System.out.print("����� ���ϴ� ������ ���� ?(2~9�ܱ����� ��)");
			dansu = sc.nextInt();
		}while(dansu < 2 || dansu>9);
		guguPrint(dansu);// ����ڷκ��� ���� ���� �������� ���
	}
	private static void guguPrint(int dansu) {// ����ڷκ��� ���� ���� �������� ���
		for(int i=1 ; i<10 ; i++) {
			System.out.printf("%d * %d = %d\n", dansu, i, dansu*i);
		}
	}
}
