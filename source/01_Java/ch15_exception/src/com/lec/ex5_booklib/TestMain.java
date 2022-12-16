package com.lec.ex5_booklib;
import java.util.Date;
import java.util.GregorianCalendar;
public class TestMain {
	public static void main(String[] args) {
		Book book1 = new Book("890��", "java", "ȫ�浿");
		Book book2 = new Book("890��", "jsp", "ȫ���");
		book1.checkOut("������");
		book2.checkOut("������");
		book2.setCheckOutDate(new Date(new GregorianCalendar(2022, 10, 1).getTimeInMillis()));
		System.out.println("book1���� : "+book1);
		System.out.println("book2���� : "+book2);
		System.out.println("= = = �ݳ��� = = =");
		try {
			book1.checkIn();
			book2.checkIn();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}