package com.lec.ex4_object;
public class Ex02_PersonMain {
	public static void main(String[] args) {
		Person p1 = new Person(9812121045215L);
		Person p2 = new Person(9812121045215L);
		Person p3 = null;
		Friend f = new Friend();
		System.out.println(p1.equals(p2)? "p1과 p2는 같다":"p1과 p2는 다르다");
		System.out.println(p1==p2 ? "p1과 p2는 같은 주소 참조":"p1과 p2는 다른 주소 참조");
		System.out.println(p1.equals(p3)? "p1과 p3는 같다":"p1과 p3는 다르다");
		System.out.println(p1.equals(f)? "p1과 f는 같다":"p1과 f는 다르다");
	}
}
















