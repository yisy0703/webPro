package com.lec.ex2_human;
//Man kim = new Man();
//Man kim = new Man("ȫ�浿");
// Man kim = new Man("ȫ�浿", 22, 170, 65);
public class Man {
	private String name;
	private int age;
	private int height;
	private double weight;
	// �����ڰ� ������ �Լ��� ����� �����Ϸ��� ����Ʈ ������ �Լ��� �� �����
	public Man() {
		System.out.println("�Ű����� ���� ������ �Լ�");
	}
	public Man(String name, int age, int height, double weight) {
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		System.out.println("������ 4�� �ʱ�ȭ�ϴ� ������ �Լ�");
	}
	// Man man = new Man(170);
	public Man(String name) {
		this.name = name;
		System.out.println("�̸� �ʱ�ȭ�ϴ� ������ �Լ�");
	}
	public Man(int height) {
		this.height = height;
	}
	public Man(double weight) {
		this.weight = weight;
	}
}
















