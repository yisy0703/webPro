package com.lec.ex2_date;
import java.util.Calendar;
public class Ex01_Calendar {
	public static void main(String[] args) {
		Calendar now = Calendar.getInstance();
		System.out.println(now);
		// 2022년 12월 14일 수요일 09시48분
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day   = now.get(Calendar.DAY_OF_MONTH);
		int week  = now.get(Calendar.DAY_OF_WEEK); // 1:일, 2:월, 3:화, 4:수,... 7:토
		int hour24 = now.get(Calendar.HOUR_OF_DAY);
		int hour   = now.get(Calendar.HOUR); // 12시간단위
		int ampm   = now.get(Calendar.AM_PM); // 0:오전, 1:오후
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		int milliSec = now.get(Calendar.MILLISECOND);
		System.out.printf("%d년 %d월 %d일 ", year, month, day);
		switch (week) {
		case 1: System.out.print("일요일"); break;
		case 2: System.out.print("월요일"); break;
		case 3: System.out.print("화요일"); break;
		}
	}
}










