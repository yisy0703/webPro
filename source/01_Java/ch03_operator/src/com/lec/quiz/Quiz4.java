package com.lec.quiz;
// ���̿� ���� ��ο��, �Ϲ� ���
import java.util.Scanner;
public class Quiz4 {
	public static void main(String[] args) {
		System.out.print("���̸� �Է��ϼ��� �� ");
		Scanner sc = new Scanner(System.in);
		int age = sc.nextInt();
		System.out.println((age>=65)? "��ο��":"�Ϲ�");
		sc.close();
	}
}
