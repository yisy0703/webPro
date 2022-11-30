package com.lec.conditionQuiz;
import java.util.Scanner;
public class Quiz5_sesson {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("현재 몇 월인가요?");
		int month = scanner.nextInt();
		switch(month){
		case 12: case 1: case 2:
			System.out.println("입력하신 개월은 겨울이네요");break;
		case 3: case 4: case 5:
			System.out.println("입력하신 개월은 봄이네요");break;
		case 6: case 7: case 8:
			System.out.println("입력하신 개월은 여름이네요");break;
		case 9: case 10: case 11:
			System.out.println("입력하신 개월은 가을이네요");break;
		default:
			System.out.println("유효한 개월 수가 아닙니다.");
		}
		if(month==12 || month==1 || month==2) {
			System.out.println("입력하신 개월은 겨울이네요");
		}else if(month==3 || month==4 || month==5) {
			System.out.println("입력하신 개월은 봄이네요");
		}else if(month==6 || month==7 || month==8) {
			System.out.println("입력하신 개월은 여름이네요");
		}else if(month==9 || month==10 || month==11) {
			System.out.println("입력하신 개월은 가을이네요");
		}else {
			System.out.println("유효한 개월 수가 아닙니다.");
		}
		scanner.close();
	}
}
