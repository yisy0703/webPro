package com.lec.ex2_date;
import java.util.GregorianCalendar;
// �� ���� ���
public class Ex03_term {
	public static void main(String[] args) {
		GregorianCalendar now = new GregorianCalendar(); // ����
		long nowMillis = now.getTimeInMillis(); // 1970.1.1 ~ now������ �и�����
		GregorianCalendar checkOut = new GregorianCalendar(2022, 10, 28, 9, 30); // �������
		long checkMillis = checkOut.getTimeInMillis(); // 1970.1.1. ~ checkOut������ �и�����
		int day = (int)((nowMillis - checkMillis)/(1000*60*60*24));
		System.out.println("���� ������ :" + day);
	}
}
