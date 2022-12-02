package com.lec.quiz;
import java.util.Scanner;
public class Quiz {
	public static void main(String[] args) {
		// 사용자로 부터 2~9까지의 원하는 구구단을 받는다.
		Scanner sc = new Scanner(System.in);
		int dansu;
		do {
			System.out.print("출력을 원하는 구구단 수는 ?(2~9단까지만 돼)");
			dansu = sc.nextInt();
		}while(dansu < 2 || dansu>9);
		guguPrint(dansu);// 사용자로부터 받은 수의 구구단을 출력
	}
	private static void guguPrint(int dansu) {// 사용자로부터 받은 수의 구구단을 출력
		for(int i=1 ; i<10 ; i++) {
			System.out.printf("%d * %d = %d\n", dansu, i, dansu*i);
		}
	}
}
