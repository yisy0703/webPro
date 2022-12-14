package com.lec.ex2_date;
import java.util.GregorianCalendar;
// 두 시점 계산
public class Ex03_term {
	public static void main(String[] args) {
		GregorianCalendar now = new GregorianCalendar(); // 지금
		long nowMillis = now.getTimeInMillis(); // 1970.1.1 ~ now까지의 밀리세컨
		GregorianCalendar checkOut = new GregorianCalendar(2022, 10, 28, 9, 30); // 대출시점
		long checkMillis = checkOut.getTimeInMillis(); // 1970.1.1. ~ checkOut까지의 밀리세컨
		int day = (int)((nowMillis - checkMillis)/(1000*60*60*24));
		System.out.println("몇일 지났나 :" + day);
	}
}
