package com.lec.ex5_momchild;
public class ChildMain {
	public static void main(String[] args) {
		Child child1 = new Child("첫째 길동이");
		Child child2 = new Child("둘째 개똥이");
		Child child3 = new Child("셋째 똘순이");
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000); // 셋째는 못 줘
	}
}
