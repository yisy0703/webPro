package com.lec.ex5_booklib;
import java.util.Date;
import java.util.GregorianCalendar;
public class TestMain {
	public static void main(String[] args) {
		Book book1 = new Book("890¤±", "java", "È«±æµ¿");
		Book book2 = new Book("890¤¡", "jsp", "È«±æµÕ");
		book1.checkOut("°¡Á®°¨");
		book2.checkOut("ºô¸°ÀÚ");
		book2.setCheckOutDate(new Date(new GregorianCalendar(2022, 10, 1).getTimeInMillis()));
		System.out.println("book1»óÅÂ : "+book1);
		System.out.println("book2»óÅÂ : "+book2);
		System.out.println("= = = ¹Ý³³ÇÔ = = =");
		try {
			book1.checkIn();
			book2.checkIn();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}