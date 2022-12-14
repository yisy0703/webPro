package com.lec.ex4_object;
public class Ex02_PersonMain {
	public static void main(String[] args) {
		Person p1 = new Person(9812121045215L);
		Person p2 = new Person(9812121045215L);
		Person p3 = null;
		Person p4 = new Person();
		if(p1.equals(p2)) {
			System.out.println("p1과 p2는 같다");
		}else {
			System.out.println("p1과 p2는 다르다");
		}
	}
}
