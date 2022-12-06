package com.lec.ex5_momchild;
// Child child1 = new Child("첫째 길동이");
// child1.takeMoney(1000);
public class Child {
	private String name;
	MomPouch momPouch;
	public Child(String name) {
		this.name = name;
		momPouch = new MomPouch();
	}
	public void takeMoney(int money) {
		if(momPouch.money >= money) {
			momPouch.money -= money; // momPouch.money = momPouch.money - money;
			System.out.println(name+"가 " +money +"원 가져가서 엄마 지갑엔 " + momPouch.money);
		}else {
			System.out.println(name + "가 돈 못받음. 현재 엄마 지갑엔 " + momPouch.money);
		}
	}
}














