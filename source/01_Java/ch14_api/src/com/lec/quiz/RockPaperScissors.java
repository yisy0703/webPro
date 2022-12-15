package com.lec.quiz;
import java.util.Random;
import java.util.Scanner;
public class RockPaperScissors {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Random  random  = new Random();
		int you, computer;
		final int SCISSOR = 0;
		final int ROCK    = 1;
		final int PAPER   = 3;
		final int NOTHING = 4;
		do{
			computer = random.nextInt(3);
			System.out.print("가위,바위,보(당신이 이기면 끝납니다) ☞ ");
			String youStr = scanner.next().trim(); // "  가위  "를 입력해도 "가위"로
			if(youStr.equals("가위")) {
				you = SCISSOR;
			}else if(youStr.equals("바위")) {
				you = ROCK;
			}else if(youStr.equals("보")) {
				you = PAPER;
			}else {
				you = NOTHING;// 가위바위보가 아닌 다른 값을 입력한 경우
				continue;
			}
			if ((you + 2) % 3 == computer) {
				printResult(you, computer);
				System.out.println("당신이 이겼어요");
			}else if (you == computer) {
				printResult(you, computer);
				System.out.println("비겼어요");
			} else {
				printResult(you, computer);
				System.out.println("당신이 졌어요");
			} // if
		}while(you==NOTHING || (you + 2) % 3 != computer); 
		System.out.println("축하해요. BYE");
		scanner.close();
	}
	private static void printResult(int me, int computer) {
		System.out.println("당신은 "+((me==0)?"가위":((me==1)?"바위":"보")));
		System.out.println("컴퓨터는 "+((computer==0)?"가위":((computer==1)?"바위":"보")));		
	} // printResult
}