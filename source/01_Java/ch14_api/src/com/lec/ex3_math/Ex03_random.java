package com.lec.ex3_math;
import java.util.Random;
// 0 <= Math.random() < 1�� double ����
public class Ex03_random {
	public static void main(String[] args) {
		System.out.println("1~45���� ���� ���� : " + (int)(Math.random()*45)+1);
		Random random = new Random();
		System.out.println("int ���� : " + random.nextInt()); // ���� ����
		System.out.println("double ���� : " + random.nextDouble()); // Math.random() ����
		System.out.println("true/false �� ���� : " + random.nextBoolean());
		System.out.println("0~100������ ���� ���� : " + random.nextInt(101));
		System.out.println("0~44������ ���� ���� : " + random.nextInt(45));
		System.out.println("1~45������ ���� ���� : " + (random.nextInt(45)+1) );
		System.out.println("����(0), ����(1), ��(2) �� �ϳ� : " + random.nextInt(3));
	}
}

