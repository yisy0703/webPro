package com.lec.camp.util;

import java.util.Scanner;

public class CalendarTest {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("원하는 년도 : ");
		int year = sc.nextInt();
		System.out.print("원하는 월 : ");
		int month = sc.nextInt();
		CalendarPrinter calPrinter1 = new CalendarPrinter(year, month);
		calPrinter1.printConsole();
		System.out.println("\n\n현재 달력");
		CalendarPrinter calPrinter2 = new CalendarPrinter();
		calPrinter2.printConsole();
		sc.close();
	}
}
