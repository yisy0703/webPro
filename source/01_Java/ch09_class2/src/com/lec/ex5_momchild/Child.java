package com.lec.ex5_momchild;
// Child child1 = new Child("ù° �浿��");
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
			System.out.println(name+"�� " +money +"�� �������� ���� ������ " + momPouch.money);
		}else {
			System.out.println(name + "�� �� ������. ���� ���� ������ " + momPouch.money);
		}
	}
}














