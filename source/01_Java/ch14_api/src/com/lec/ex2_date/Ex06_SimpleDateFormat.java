package com.lec.ex2_date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
public class Ex06_SimpleDateFormat {
	public static void main(String[] args) {
		Date              nowDate = new Date();
		Calendar          nowCal = Calendar.getInstance();
		GregorianCalendar nowGc = new GregorianCalendar(2022,1,1);
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		System.out.println(sdf.format(nowDate));
	}
}























