package com.lec.loop;
// 1~100까지 숫자 중 3의 배수의 합을 출력
public class Ex09while {
	public static void main(String[] args) {
		int tot = 0;
		int i = 0;
		while( ++i <= 100) {
			if(i%3 == 0) {
				tot += i;
			}
//			if(i%3 != 0) {
//				continue;
//			}
//			tot += i;
		}
		System.out.println(tot);
	}
}
