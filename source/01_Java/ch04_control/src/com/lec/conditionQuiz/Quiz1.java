package com.lec.conditionQuiz;
import java.util.Scanner;
public class Quiz1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("정수를 입력하세요 ☞ ");
		int su = scanner.nextInt();
		if(su>=0) {
			System.out.printf("입력하신 수의 절대값은 %d\n", su);
		}else {
			System.out.printf("입력하신 수의 절대값 : %d\n", -su);
		}
		scanner.close();
	}
}
