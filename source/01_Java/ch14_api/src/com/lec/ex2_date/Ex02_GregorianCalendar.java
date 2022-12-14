package com.lec.ex2_date;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class Ex02_GregorianCalendar {
	public static void main(String[] args) {
		//Calendar now = Calendar.getInstance();
		GregorianCalendar now = new GregorianCalendar();
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
			case 4: System.out.print("수요일"); break;
			case 5: System.out.print("목요일"); break;
			case 6: System.out.print("금요일"); break;
			case 7: System.out.print("토요일"); break;
		}		
		System.out.printf("%d시 %d분 %d초 %d(%s %d시 %d분 %d초)\n",
				hour24, minute, second, milliSec, 
				(ampm==0 ? "오전":"오후"), hour, minute, second);
		// %d(정수)
		// %tY(년), %tm(월), %td(일) %ta(요일) %tH(24시) %tp(오전/오후) %tl(12시) %tM(분) %tS(초)
		System.out.printf("%tY년 %tm월 %td일 %ta요일 %tH시 %tM분 %tS초(%tp %tl시)\n", 
				now, now, now, now, now, now, now, now, now);
		System.out.printf("%1$tY년 %1$tm월 %1$td일 %1$ta요일 %1$tH시 %1$tM분 %1$tS초(%1$tp %1$tl시)\n", 
				now);
	}
}










