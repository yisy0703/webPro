package com.lec.ex09_customer;
// name, tel
public class Customer extends Person {
	private String address;
	private int    sum; // 구매금액 누적
	private int    point; // 포인트(구매시 0.5%)
	private String date;  // String을 다음주부터는 Date형
	private boolean vip;
	// Customer c = new Customer("홍길동", "010-9999-9999", "서울", "12-12")
	public Customer(String name, String tel, String address, String date) {
		super(name, tel);
		this.address = address;
		this.date = date;
		point = 1000;
		System.out.println(name+"님 가입 감사합니다. 포인트 1000점을 드렸습니다");
	}

}










