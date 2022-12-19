package com.lec.ex2_map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

import com.lec.ex1_list.Friend;
public class Ex03_FriendHashMap {
	public static void main(String[] args) {
		HashMap<String, Friend> friends = new HashMap<String, Friend>();
		friends.put("010-9999-9999", new Friend("홍길동", "010-9999-9999"));
		friends.put("010-8888-9999", new Friend("김길동", "010-8888-9999"));
		friends.put("010-7777-7777", new Friend("신길동", "010-7777-7777"));
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("검색하고자 하는 전화번호는 (종료:x) ? ");
			String searchTel = sc.next();
			if(searchTel.equalsIgnoreCase("x")) break;
			if(friends.get(searchTel) != null) {
				System.out.println("검색 결과 : " + friends.get(searchTel));
			}else {
				System.out.println("검색한 전화번호가 없습니다");
			}
		}// while
		sc.close();
	}
}













