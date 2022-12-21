package com.lex.ex5_atm;
public class AtmMain {
	public static void main(String[] args) {
		ATM atm = new ATM(1000);
		Runnable card = new AtmTarget(atm);
		Thread t1 = new Thread(card, "엄◑.◐마");
		Thread t2 = new Thread(card, "아빠");
		t1.start();
		t2.start();
	}
}
