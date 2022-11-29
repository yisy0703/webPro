package com.lec.quiz;
// 입력한 두수에 대해 출력
import java.util.Scanner;
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("첫번째 수는 ");
		int num1 = sc.nextInt();
		System.out.print("두번째 수는 ");
		int num2 = sc.nextInt();
		System.out.println("두수가 같은지 결과는 "+((num1==num2)? "O":"X"));
		System.out.println("첫번째 수가 더 큰지 여부 "+((num1>num2)? "O":"X"));
		sc.close();
	}
}
