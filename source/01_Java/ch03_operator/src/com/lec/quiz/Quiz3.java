package com.lec.quiz;
// �Է��� �μ��� ���� ���
import java.util.Scanner;
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° ���� ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° ���� ");
		int num2 = sc.nextInt();
		System.out.println("�μ��� ������ ����� "+((num1==num2)? "O":"X"));
		System.out.println("ù��° ���� �� ū�� ���� "+((num1>num2)? "O":"X"));
		sc.close();
	}
}
