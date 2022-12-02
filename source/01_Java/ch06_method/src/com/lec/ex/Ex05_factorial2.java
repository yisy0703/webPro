package com.lec.ex;
import java.util.Scanner;
// s! = s * (s-1) * (s-2) * .... 2 * 1
public class Ex05_factorial2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num;
		do {
			System.out.print("몇 !을 계산할까요? ");
			num = scanner.nextInt();
		}while(num<=0);
		long result = factorial(num);
		System.out.println(num + "! = " + result);
	}
	// s! = s * (s-1)!
	// 1! = 1 (factorial 계산은 양수만 입력하는 것으로 한다)
	private static long factorial(int s) {
		if(s == 1) {
			return 1;
		}else {
			return s * factorial(s-1); 
		}
	}
}







