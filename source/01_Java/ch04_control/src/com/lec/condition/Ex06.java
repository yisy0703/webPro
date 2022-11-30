package com.lec.condition;
import java.util.Scanner;
// 입력받은 수가 홀수인지 짝수인지 출력
public class Ex06 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("정수를 입력하세요");
		int num = scanner.nextInt();
		switch (num%2) {
		case 0:
			System.out.println("짝수입니다");
			break;
		default:
			System.out.println("홀수입니다");
			break;
		}
		scanner.close();
	}
}
