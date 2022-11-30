package com.lec.loop;
/* 	i가 1일 때 누적합은 1이다
	i가 10일 때 누적합은 55이다 */
public class Ex08while {
	public static void main(String[] args) {
		int tot = 0; // 누적합 변수
		int i=1;
		while(i<=10) {
			tot += i;
			System.out.printf("i가 %d일 때 누적합은 %d이다\n", i, tot);
			i++;
		}
//		for(int i=1 ; i<=10 ; i++) {
//			tot += i; //tot = tot + i;
//			System.out.printf("i가 %d일 때 누적합은 %d이다\n", i, tot);
//		}
	}
}
