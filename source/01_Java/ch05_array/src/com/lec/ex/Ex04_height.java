package com.lec.ex;
import java.util.Scanner;
// 배열을 이용하여 학생들(영희, 철수, 길동, 영수, 말자)의 키를 입력받고, 평균치를 구해보자.
// 가장 큰 학생과 가장 작은 학생
public class Ex04_height {
	public static void main(String[] args) {
		String[] arrName = {"영희", "철수", "길동", "영수", "말자"};
		int[]    arrHeight = new int[arrName.length];
		Scanner scanner = new Scanner(System.in);
		int totHeight = 0;
		// 키 입력받기 -> totHeight 누적
		for(int idx=0 ; idx<arrName.length ; idx++) {
			System.out.print(arrName[idx]+"의 키는 ?");
			arrHeight[idx] = scanner.nextInt();
			totHeight += arrHeight[idx]; // 누적
		}
		for(int idx=0 ; idx<arrName.length ; idx++) {
			System.out.printf("%d번째 %s의 키는 %d\n", idx, arrName[idx], arrHeight[idx]);
		}
		System.out.println("평균키는 " + (double)totHeight/arrHeight.length);
		scanner.close();
		// 가장 큰 학생과 가장 작은 학생
		int maxIdx=0, maxHeight=0; // 최장신을 구하기 위한 변수들(작은값으로 초기화)
		int minIdx=0, minHeight=9999; // 최단신을 구하기 위한 변수들(큰값으로 초기화)
		for(int idx=0 ; idx<arrName.length ; idx++) {
			if(arrHeight[idx] > maxHeight) {
				maxHeight = arrHeight[idx];
				maxIdx = idx;
			}//if-최대값
			if(arrHeight[idx] < minHeight) {
				
			}// if-최소값
		}//for
	}//main
}//class







