package com.lec.ex09_customer;
// name, tel
public class Customer extends Person {
	private String address;
	private int    sum; // ���űݾ� ����
	private int    point; // ����Ʈ(���Ž� 0.5%)
	private String date;  // String�� �����ֺ��ʹ� Date��
	private boolean vip;
	// Customer c = new Customer("ȫ�浿", "010-9999-9999", "����", "12-12")
	public Customer(String name, String tel, String address, String date) {
		super(name, tel);
		this.address = address;
		this.date = date;
		point = 1000;
		System.out.println(name+"�� ���� �����մϴ�. ����Ʈ 1000���� ��Ƚ��ϴ�");
	}

}










