package com.lec.quiz;
// 나이에 따른 경로우대, 일반 출력
import java.util.Scanner;
public class Quiz4 {
	public static void main(String[] args) {
		System.out.print("나이를 입력하세요 ☞ ");
		Scanner sc = new Scanner(System.in);
		int age = sc.nextInt();
		System.out.println((age>=65)? "경로우대": ((age>=0)? "일반":"떼끼"));
		sc.close();
	}
}
