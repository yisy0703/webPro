package com.lec.conditionQuiz;
import java.util.Scanner;
public class Quiz4_if_srpPattern {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int you, computer;
		computer = (int)(Math.random()*3);
		System.out.println("가위(0),바위(1),보(2) 중 하나를 선택하세요 : ");
		you = scanner.nextInt(); // 0,1,2
		if(you == 0) {
			System.out.print("당신은 가위\t컴퓨터는 ");
		}else if(you == 1) {
			System.out.print("당신은 바위\t컴퓨터는 ");
		}else if(you == 2) {
			System.out.print("당신은 보자기\t컴퓨터는 ");
		}else {
			System.out.print("당신 잘못 냈어요. 다음엔 잘 내요");
			you = 3;
		}
		if(you!=3) {
			String msg = (computer==0) ? "가위" : (computer==1)?"바위":"보자기";
			System.out.println(msg);
			if( (you+2)%3 == computer ) {
				System.out.println("당신이 이겼어요!!");
			}else if((you+1)%3 == computer){
				System.out.println("컴퓨터가 이겼어요. 메롱");
			}else {
				System.out.println("비겼어요.");
			}
		}
		scanner.close();
	}
}
