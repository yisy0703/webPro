package com.lec.quiz;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		ArrayList<Friend> friends = new ArrayList<Friend>();
		friends.add(new Friend("홍길동", "010-9999-9999", "서울 용산", new Date(98,0,1)));
		friends.add(new Friend("홍길동", "010-8888-9999", "부산 해운대", new Date(new GregorianCalendar(95,9,13).getTimeInMillis())));
		friends.add(new Friend("홍길동", "010-7777-7777", "서울 서대문", new Date(new GregorianCalendar(94,11,18).getTimeInMillis())));
		Scanner scanner = new Scanner(System.in);
		String searchWord;
		do {
			System.out.print("\n검색할 주소 앞 글자 2자리(단, 종료를 원하시면 x를 입력하시오) : ");
			searchWord = scanner.next();
			if(searchWord.equalsIgnoreCase("x")) break;
			boolean none = true;
			for(Friend friend : friends) {
				String preAddress = friend.getAddress().substring(0,2);
				if(preAddress.equals(searchWord)) {
					System.out.println(friend);
					none = false;
				}
			}// for
			if(none) {
				System.out.println("해당 지역의 친구는 없습니다");
			}
		}while(true);
		scanner.close();
	}
}
