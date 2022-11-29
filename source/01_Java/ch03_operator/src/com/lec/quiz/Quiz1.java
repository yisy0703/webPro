package com.lec.quiz;
import java.util.Scanner;
//3의 배수 숫자 판단하기 : 사용자로부터 숫자를 입력 받고, 입력 받은 숫자가 3의 배수인지 파악
public class Quiz1 {
	public static void main(String[] args) {
		//String name = new String("홍길동");
		//System.out.println(name.toUpperCase());
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하세요 : ");
		int su = sc.nextInt(); // 키보드로부터 입력받은 정수를 반환하는 기능
		String result = (su % 3 == 0) ? "3의 배수입니다":"3의 배수가 아닙니다";
		//System.out.println("입력하신 수 (" + su + ")는" + result);
		System.out.printf("입력하신 수(%d)는 %s\n", su, result);
	}
}













