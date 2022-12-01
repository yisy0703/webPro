package com.lec.ex;
public class Ex02 {
	public static void main(String[] args) {
		int i = 10;
		int j = i;
		j = 99;
		System.out.printf("i = %d, j=%d\n", i, j);
		int[] score = {10,20,30,40,50};
		int[] s     = score;
		s[0] = 99;
		for(int idx=0 ; idx<s.length ; idx++) {
			System.out.printf("score[%d] = %d\t s[%d] = %d\n", idx, score[idx], idx, s[idx]);
		}
	}
}










