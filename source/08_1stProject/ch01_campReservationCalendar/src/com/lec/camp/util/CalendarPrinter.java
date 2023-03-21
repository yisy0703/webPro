package com.lec.camp.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CalendarPrinter {
	private Calendar calendar;
	private String[][] calDate = new String[6][7];
	private String[] title = {"일","월","화","수","목","금","토"};
	private int width = title.length; //7
	private int startday; // 시작하는 요일 (1:일, 2:월, ..)
	private int lastday;  // 월의 마지막 날짜
	private int day=1;      // 날짜를 뿌리기 위한 변수
	public CalendarPrinter(int year, int month) {
		if(month<1 || month>12) {
			System.out.println("월의 범위를 벗어났습니다");
			System.exit(1);
		}
		calendar = Calendar.getInstance(); // 날짜 시간 객체
		calendar.set(year, month-1, 1); // 날짜 셋팅
//		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
//		System.out.println(sdf.format(calendar.getTime()));
		startday = calendar.get(Calendar.DAY_OF_WEEK); // 월의 시작하는 요일 (1:일, 2:화, ..)
		lastday = calendar.getActualMaximum(Calendar.DATE); //월이 끝나는 날
		int row = 0;
		for(int i=1 ; day<=lastday ; i++) {
			if(i<startday) {//뿌리면 안 되는 것
				calDate[row][i-1] = "";
			}else {
				// 뿌려야되는 것
				calDate[row][(i-1)%width] = String.valueOf(day++);
				if(i%width==0) row++;
			}
		}
	}// 생성자
	public CalendarPrinter() {
		calendar = Calendar.getInstance(); // 날짜 시간 객체
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		calendar.set(year, month, 1); // 날짜 셋팅
//		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
//		System.out.println(sdf.format(calendar.getTime()));
		startday = calendar.get(Calendar.DAY_OF_WEEK); // 월의 시작하는 요일 (1:일, 2:화, ..)
		System.out.println("startday(1:일, 2:화, ..) : " + startday);
		lastday = calendar.getActualMaximum(Calendar.DATE); //월이 끝나는 날
		int row = 0;
		for(int i=1 ; day<=lastday ; i++) {
			if(i<startday) {//뿌리면 안 되는 것
				calDate[row][i-1] = "";
			}else {
				// 뿌려야되는 것
				calDate[row][(i-1)%width] = String.valueOf(day++);
				if(i%width==0) row++;
			}
		}
	}// 생성자
	public void printConsole() {
		for(String t :title) {
			System.out.print(t + "\t");
		}
		System.out.println();
		for(int i=0 ; i<calDate.length ; i++) {
			for(int j=0 ; j<calDate[i].length ; j++) {
				if(calDate[i][j]!=null) {
					System.out.print(calDate[i][j] + "\t");
				}//if
			}//for - j
			System.out.println();// 개행
		}//for - i
	}
//	public String printBrowser() {
//		String out = "<table><tr>";
//		for(String t :title) {
//			out += "<th>" + t + "</th>";
//		}
//		out += "</tr>";
//		for(int i=0 ; i<calDate.length ; i++) {
//			out += "<tr>";
//			for(int j=0 ; j<calDate[i].length ; j++) {
//				if(calDate[i][j]!=null) {
//					out += "<td>" + calDate[i][j] + "</td>";
//				}//if
//			}//for - j
//			out += "</tr>";// 개행
//		}//for - i
//		return out;
//	}
	public String[][] getCalDate() {
		return calDate;
	}
	public String[] getTitle() {
		return title;
	}
}
