package com.lec.ex2_date;
import java.util.Date;
public class Ex04_Date {
	public static void main(String[] args) {
		Date now = new Date();
		System.out.println(now);
		int year = now.getYear() + 1900;
		int month = now.getMonth() +1;
		int day = now.getDate();
		System.out.println(year + "년 " + month +"월 " + day +"일 ");
		System.out.printf("%1$tY년 %1$tm월 %1$td일 %1$ta요일 %1$tH시 %1$tM분 %1$tS초(%1$tp %1$tl시)\n", 
				now);
	}
}
