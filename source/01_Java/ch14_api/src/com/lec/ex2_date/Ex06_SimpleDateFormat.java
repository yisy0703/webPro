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
		/* yyyy(년도 4자리) yy(년도 2자리) MM(03) M(3) dd(08) d(8)
		 * E(요일) a(오전/오후)  H(24시) h(12시) m(분) s(초)	 
		 * w(이번년도에 몇번째 주인지) W(이번 월에 몇번째 주인지) D(올해의 몇번째 날) */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일(E) a hh시 mm분 ss초");
		String dateStr = sdf.format(nowDate);
		String calStr  = sdf.format(nowCal.getTime()); // getTime : Calendar나 gregorian을 Date형으로 변환
		String gcStr   = sdf.format(nowGc.getTime());
		System.out.println(dateStr);
		System.out.println(calStr);
		System.out.println(gcStr);
	}
}























