package com.lec.quiz;

public class Quiz1 {
	public static void main(String[] args) {
		int[] arr =  {10, 20, 30, 40, 50};
		int tot = 0;
//		for(int idx=0 ; idx<arr.length ; idx++) {
//			tot += arr[idx];
//		}
		for(int temp : arr) {
			tot += temp;
		}
		System.out.println("배열에 저장된 값들의 합계는 "+tot);
	}
}
