package com.lec.ex5_booklib;
public interface ILendable {
	public byte STATE_BORROWED = 1; // "대출중"을 의미
	public byte STATE_NORMAL   = 0; // "대출가능"을 의미
	public void checkOut(String borrower); // 대출
	public void checkIn() throws Exception; // 반납
}
