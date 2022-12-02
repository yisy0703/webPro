package com.lec.ex;
// return 값이 없는 메소드
public class Ex04_voidMethod {
	public static void main(String[] args) {
		printLine(); 
		System.out.println("Hello, World!");
		printLine('~'); 
		System.out.println("Hello, Java");
		printLine(15);
		System.out.println("Hello, World!");
		Ex04_voidMethod ex = new Ex04_voidMethod();
		ex.printLine(21, '#');
	}
	private void printLine(int cnt, char ch) {
		for(int i=0 ; i<cnt ; i++) {
			System.out.print(ch);
		}
		System.out.println();//개행
	}
	private static void printLine(int cnt) {
		for(int i=0 ; i<cnt ; i++) {
			System.out.print('-');
		}
		System.out.println();
	}
	private static void printLine(char ch) {
		for(int i=0 ; i<20 ; i++) {
			System.out.print(ch);
		}
		System.out.println(); // 기본 라인 그리고 개행
	}
	private static void printLine() {
		for(int i=0 ; i<20 ; i++) {
			System.out.print('-');
		}
		System.out.println(); // 기본 라인 그리고 개행
	}
}
