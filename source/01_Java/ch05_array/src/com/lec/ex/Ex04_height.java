package com.lec.ex;
import java.util.Scanner;
// 배열을 이용하여 학생들(영희, 철수, 길동, 영수, 말자)의 키를 입력받고, 평균치를 구해보자.
public class Ex04_height {
	public static void main(String[] args) {
		String[] arrName = {"영희", "철수", "길동", "영수", "말자"};
		int[]    arrHeight = new int[arrName.length];
		Scanner scanner = new Scanner(System.in);
		int totHeight = 0;
		// 키 입력받기 -> totHeight 누적
		for(int idx=0 ; idx<arrName.length ; idx++) {
			System.out.print(arrName[idx]+"의 키는 ?");
		}
	}
}







