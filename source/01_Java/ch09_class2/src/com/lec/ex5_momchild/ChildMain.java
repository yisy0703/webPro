package com.lec.ex5_momchild;
public class ChildMain {
	public static void main(String[] args) {
		Child child1 = new Child("첫째 길동이");
		Child child2 = new Child("둘째 개똥이");
		Child child3 = new Child("셋째 똘순이");
		System.out.println("첫째 엄마 지갑 : " + child1.momPouch.money);
		System.out.println("둘째 엄마 지갑 : " + child2.momPouch.money);
		System.out.println("세째 엄마 지갑 : " + child3.momPouch.money);
		System.out.println("static 지갑 : " + Child.momPouch.money);
		child1.takeMoney(1000);
		System.out.println("첫째 엄마 지갑 : " + child1.momPouch.money);
		System.out.println("둘째 엄마 지갑 : " + child2.momPouch.money);
		System.out.println("세째 엄마 지갑 : " + child3.momPouch.money);
		System.out.println("static 지갑 : " + Child.momPouch.money);
		child2.takeMoney(1000);
		child3.takeMoney(1000); // 셋째는 못 줘
	}
}
