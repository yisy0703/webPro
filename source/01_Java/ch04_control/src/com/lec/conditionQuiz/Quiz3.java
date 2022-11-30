package com.lec.conditionQuiz;
import java.util.Scanner;
public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("가위(0), 바위(1), 보(2)중 하나를 선택하세요 :");
		int you = scanner.nextInt(); // 0, 1, 2
		if(you == 0) {
			System.out.println("당신은 가위");
		}else if(you == 1) {
			System.out.println("당신은 바위");
		}else if(you == 2) {
			System.out.println("당신은 보");
		}else {
			System.out.println("유효하지 않는 값입니다");
		}
		scanner.close();
	}
}
