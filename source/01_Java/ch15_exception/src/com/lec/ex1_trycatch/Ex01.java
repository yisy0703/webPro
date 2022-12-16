package com.lec.ex1_trycatch;
import java.util.Scanner;
public class Ex01 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int i, j; // 사용자에게 입력받을 수를 저장
		System.out.print("첫번째 정수는?");
		i = scanner.nextInt();
		System.out.print("두번째 정수는?");
		j = scanner.nextInt();
		System.out.println("i = " + i + ", j="+j);
		System.out.println("i * j = " + (i*j));
		try {
			System.out.println("i / j = " + (i/j)); // 예외가 발생할 수도 있는 부분
		}catch(ArithmeticException e) { // 예외발생시 수행 부분
			System.out.println(e.getMessage()); // 예외메세지 출력
		}
		System.out.println("i + j = " + (i+j));
		System.out.println("i - j = " + (i-j));
		System.out.println("DONE");
		scanner.close();
	} 
}










