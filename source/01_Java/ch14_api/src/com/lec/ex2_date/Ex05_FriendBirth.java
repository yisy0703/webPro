package com.lec.ex2_date;
import java.util.Calendar;
import java.util.GregorianCalendar;

import com.lec.ex4_object.Friend;
// 오늘 생일인 친구들 출력
public class Ex05_FriendBirth {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("홍길동", "010-9999-9999", "12-01", "서울 서대문"),
				new Friend("김길동", "010-8888-9999", "12-14", "수원 영통"),
				new Friend("신길동", "010-9999-7777", "02-10", "서울 용산"),
				new Friend("마길동", "010-6666-6666", "03-03", "인천 송도"),};
		GregorianCalendar now = new GregorianCalendar();
		int month = now.get(Calendar.MONTH) + 1; // 3
		int day   = now.get(Calendar.DAY_OF_MONTH); // 3
		String monthStr = month<10 ? "0"+month : ""+month; // "" + 12 => "12"
		// monthStr = month<10 ? "0"+month : String.valueOf(month); // "12"
		String dayStr = day < 10 ? "0"+day : ""+day;
		String today = monthStr + "-" + dayStr;  //"12-14"
		System.out.println(today);
		boolean none = true;
		System.out.println("오늘 생일인 친구 목록을 검색합니다");
		for(int idx=0 ; idx<friends.length ; idx++) {
			String birth = friends[idx].getBirth();
			if(today.equals(birth)) {
				System.out.println(friends[idx]);
				none = false; // 한명이상 출력 시 none은 false
			}//if
		}//for
		if(none) {
			System.out.println("오늘 생일인 친구가 없습니다");
		}
	}//main
}//class

















