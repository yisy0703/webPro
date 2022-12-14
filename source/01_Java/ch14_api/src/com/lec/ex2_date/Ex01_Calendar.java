package com.lec.ex2_date;
import java.util.Calendar;
public class Ex01_Calendar {
	public static void main(String[] args) {
		Calendar now = Calendar.getInstance();
		System.out.println(now);
		// 2022�� 12�� 14�� ������ 09��48��
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day   = now.get(Calendar.DAY_OF_MONTH);
		int week  = now.get(Calendar.DAY_OF_WEEK); // 1:��, 2:��, 3:ȭ, 4:��,... 7:��
		int hour24 = now.get(Calendar.HOUR_OF_DAY);
		int hour   = now.get(Calendar.HOUR); // 12�ð�����
		int ampm   = now.get(Calendar.AM_PM); // 0:����, 1:����
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		int milliSec = now.get(Calendar.MILLISECOND);
		System.out.printf("%d�� %d�� %d�� ", year, month, day);
		switch (week) {
		case 1: System.out.print("�Ͽ���"); break;
		case 2: System.out.print("������"); break;
		case 3: System.out.print("ȭ����"); break;
		}
	}
}










