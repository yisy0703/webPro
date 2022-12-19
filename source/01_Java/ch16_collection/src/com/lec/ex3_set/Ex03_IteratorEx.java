package com.lec.ex3_set;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;

import com.lec.ex1_list.Friend;
public class Ex03_IteratorEx {
	public static void main(String[] args) {
		// 1. list 계열
		ArrayList<String> list = new ArrayList<String>();
		list.add("SAMPLE1");list.add("SAMPLE2");
		Iterator<String> iterator = list.iterator();
		while(iterator.hasNext()) {
			System.out.print(iterator.next() + "\t");
		}
		System.out.println();
		for(int i=0 ; i<list.size() ; i++) {
			System.out.print(list.get(i) + "\t");
		}
		System.out.println();
		for(String temp : list) {
			System.out.print(temp + "\t");
		}
		System.out.println("\n = = = 2. Map 계열 = = =");
		HashMap<String, Friend> map = new HashMap<String, Friend>();
		map.put("홍길동", new Friend("홍길동", "010-9999-9999"));
		map.put("성춘향", new Friend("성춘향", "010-8888-9999", 
				new Date(new GregorianCalendar(1995,0,1).getTimeInMillis())));
		map.put("신길동", new Friend("신길동", "010-7777-9999"));
		Iterator<String> iterator2 = map.keySet().iterator();
		while(iterator2.hasNext()) {
			String key = iterator2.next();
			System.out.println(key + " : " + map.get(key));
		}
	}
}








