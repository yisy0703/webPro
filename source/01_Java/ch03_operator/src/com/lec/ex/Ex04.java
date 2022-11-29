package com.lec.ex;
// 논리연산자 : &&(AND), ||(OR), !
public class Ex04 {
	public static void main(String[] args) {
		int i=1, j=10, h=10;
		System.out.println("&& : (i<j) && (++j>h) 는" + ((i<j) && (++j>h)) );
		System.out.println("j = " + j); // j=11
		// &&연산의 경우 좌항이 false의 경우 우항의 값은 보지 않는다.
		System.out.println("&& : (i>j) && (++j>h) 는" + ((i>j) && (++j>h)) );
		System.out.println("j = " + j);
		
		System.out.println("|| : (i<j) || (++j>h) 는" + ((i<j) || (++j>h)) );
		System.out.println("j = " + j); // j=11
		// &&연산의 경우 좌항이 false의 경우 우항의 값은 보지 않는다.
		System.out.println("|| : (i>j) || (++j>h) 는" + ((i>j) || (++j>h)) );
		System.out.println("j = " + j);
	}
}
