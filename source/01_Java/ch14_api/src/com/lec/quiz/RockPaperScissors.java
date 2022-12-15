package com.lec.quiz;

import java.util.Scanner;

public class RockPaperScissors {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int you, computer;
		do{
			System.out.println("가위,바위,보 중 하나를 선택하세요(당신이 이기면 끝납니다)");
		}wihle();
	}
	private static void printResult(int me, int computer) {
		System.out.println("당신은 "+((me==0)?"가위":((me==1)?"바위":"보")));
		System.out.println("컴퓨터는 "+((computer==0)?"가위":((computer==1)?"바위":"보")));		
	} // printResult

}
