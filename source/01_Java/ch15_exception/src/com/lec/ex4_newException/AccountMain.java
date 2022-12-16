package com.lec.ex4_newException;

public class AccountMain {
	public static void main(String[] args) {
		Account acc1 = new Account("111-111", "ȫ�浿");
		acc1.deposite(10000);
		try {
			acc1.withdraw(19000);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
