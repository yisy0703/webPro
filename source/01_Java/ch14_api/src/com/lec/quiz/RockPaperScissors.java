package com.lec.quiz;

import java.util.Random;
import java.util.Scanner;

public class RockPaperScissors {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Random  random  = new Random();
		int you, computer;
		do{
			computer = random.nextInt(3);
			System.out.println("가위,바위,보 중 하나를 선택하세요(당신이 이기면 끝납니다)");
			String youStr = scanner.next().trim();
			if(youStr.equals("가위")) {
				you = 0;
			}else if(youStr.equals("바위")) {
				you = 1;
			}else if(youStr.equals("보")) {
				you = 2;
			}else {
				you = -1;// 가위바위보가 아닌 다른 값을 입력한 경우
				continue;
			}
			
		}while(you==-1 || (you + 2) % 3 != computer); 
		System.out.println("축하해요. BYE");
		scanner.close();
	}
	private static void printResult(int me, int computer) {
		System.out.println("당신은 "+((me==0)?"가위":((me==1)?"바위":"보")));
		System.out.println("컴퓨터는 "+((computer==0)?"가위":((computer==1)?"바위":"보")));		
	} // printResult

}
