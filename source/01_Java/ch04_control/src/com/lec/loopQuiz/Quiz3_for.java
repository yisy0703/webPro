package com.lec.loopQuiz;

import java.util.Scanner;
public class Quiz3_for {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("몇단 원해?");
		int dansu = scanner.nextInt();
		for(int i=1 ; i<10 ; i++) {
			//System.out.printf("%d * %d = %d\n", dansu, i, dansu*i);
			System.out.println(dansu+"*"+i+"="+(dansu*i));
		}
		scanner.close();
	}
}
