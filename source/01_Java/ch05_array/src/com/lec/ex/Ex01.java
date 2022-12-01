package com.lec.ex;
public class Ex01 {
	public static void main(String[] args) {
		int i = 10; // int 변수의 선언과 초기화
		// 1. 배열 변수 선언과 초기화
		int[] iArr = {10,20,30,40,50};
		iArr[2] = 300; // 배열은 index로 접근(0~4)
		for(int idx=0 ; idx<iArr.length ; idx++) {//iArr.length : 배열 방의 갯수
			System.out.println(iArr[idx]);
		}
		// 2. 배열 변수 선언과 배열 메모리 공간 확보
		int[] iArr2 = new int[5];
		iArr2[0] = 999;
		for(int idx=0 ; idx<iArr2.length ; idx++) {
			System.out.printf("iArr2[%d] = %d\n", idx, iArr2[idx]);
		}
		// 3. 배열 변수 선언
		int[] iArr3;
		iArr3 = new int[3]; // {0,0,0}
		// 확장 for문
	}
}




