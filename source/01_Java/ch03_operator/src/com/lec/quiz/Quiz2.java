package com.lec.quiz;
import java.util.Scanner;
// �Է��� ���� ¦/Ȧ�� ���� ���
public class Quiz2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("�� �Է� : ");
		int i = scanner.nextInt();
		int result = i%2;
		System.out.println((result==0)? "�Է��� ���� ¦��":"�Է��� ���� Ȧ��");
		scanner.close();
	}
}
