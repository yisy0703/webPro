package com.lec.ex4_newException;
/* 데이터(속성) : accountNo(String), ownerName(String), balance(long)
 * 기능(메소드) : deposit(예금), withdraw(인출), infoPrint(정보출력) */
public class Account {
	private String accountNo;
	private String ownerName;
	private long balance;
	public Account() {}
	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		// balance = 0;
		System.out.println(ownerName+"님 계좌 개설 감사합니다. 잔액 : " + balance);
	}
	public Account(String accountNo, String ownerName, long balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
		System.out.println(ownerName+"님 계좌 개설 감사합니다. 잔액 : " + balance);
	}
	public void deposite(long money) {// 무조건 예금하기
		balance += money; // balance = balance + money;
		System.out.println(money + "원 예금하여 잔액 : " + balance);
	}
	public void withdraw(long money) throws Exception { // 잔액이 있을 경우만 인출하기. 잔액부족시 떼끼 출력
		if(balance>=money) {
			balance -= money;
			System.out.println(money + "원 인출하여 잔액 : " + balance);
		}else {
			// ch15장에서는 강제 예외 발생
			throw new Exception("★ 잔액이 부족하여 인출 불가합니다");
		}
	}
	public void infoPrint() {
		// "110-352-7894" 홍길동님 잔액 : 10원 출력
//		System.out.println("\""+accountNo+"\" " + ownerName+"님 잔액 : " + balance + "원");
		System.out.printf("\" %s \" %s님 잔액 : %d원\n", accountNo, ownerName, balance);
	}
	public String infoString() {
		//return "\""+accountNo+"\" " + ownerName+"님 잔액 : " + balance + "원";
		return String.format("\" %s \" %s님 잔액 : %d원\n", accountNo, ownerName, balance);
	}
	// setter : ownerName
	// getter : accountNo, ownerName, balance
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public long getBalance() {
		return balance;
	}
	public void setBalance(long balance) {
		this.balance = balance;
	}
}