package com.lec.ex08_booklib;
public interface ILendable {
	public byte STATE_BORROWED = 1; // "대출중"을 의미
	public byte STATE_NORMAL   = 0; // "대출가능"을 의미
	public void checkOut(String borrower, String checkOutDate); // 대출
	public void checkIn(); // 반납
	public void printState(); // "책번호 책이름(저자) 대출가능여부" 출력
}
