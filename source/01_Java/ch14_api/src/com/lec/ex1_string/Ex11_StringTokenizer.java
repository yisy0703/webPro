package com.lec.ex1_string;
import java.util.StringTokenizer;
public class Ex11_StringTokenizer {
	public static void main(String[] args) {
		String str1 = "박보검 설현 수지 고소영 장동건";
		String str2 = "100-90-85-76";
		StringTokenizer tokenizer1 = new  StringTokenizer(str1); //구분자는 space
		StringTokenizer tokenizer2 = new StringTokenizer(str2, "-"); // 구분자는 -
		System.out.println("tokenizer1의 토큰 갯수 : " + tokenizer1.countTokens());
		System.out.println("tokenzier2의 토큰 갯수 : " + tokenizer2.countTokens());
		while(tokenizer1.hasMoreTokens()) {
			System.out.println(tokenizer1.nextToken());
		}
		while(tokenizer2.hasMoreTokens()) {
			System.out.println(tokenizer2.nextToken());
		}
	}
}
