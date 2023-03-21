package com.lec.menucal.util;

import java.util.Scanner;

public class CalendarTest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("원하는 년도 :");
		int year = sc.nextInt();
		System.out.print("원하는 월 : ");
		int month = sc.nextInt();
		CalendarPrinter calPrinter = new CalendarPrinter(year, month);
		calPrinter.printConsole();
		sc.close();
	}
}
