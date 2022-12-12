package com.lec.quiz;
// Book book = new Book("890ㅁ-01-11", "java","홍길동")
public class BookLib extends BookInfo  implements ILendable {
	private String borrower;  // 대출인
	private String checkOutDate; // 대출일
	private byte state;          // 대출가능(0), 대출중(1)
	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}
	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if(state == STATE_BORROWED) { // 대출중이면 메세지 뿌리고 끝
			System.out.println(getBookTitle() + " 도서는 대출중입니다");
			return;
		}
		// state가 0(STATE_NORMAL)이라서 대출 진행
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED; // "대출중" 상태로 전환
		System.out.println(getBookTitle() + " 도서가 대출 처리 되었습니다");
		System.out.println("대출인 : " + borrower +"\t대출일:"+checkOutDate);
	}
	@Override
	public void checkIn() {
		if(state==STATE_NORMAL) {
			System.out.println(getBookTitle() +" 도서는 반납완료된 책입니다. 확인하세요");
			return;
		}
		// state가 대출중(1:STATE_BORROWED)이라 반납 처리
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(getBookTitle() + " 도서가 반납 완료되었습니다");
	}
	@Override
	public void printState() {
//		if(state==STATE_NORMAL) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer +"著) - 대출가능");
//		}else if(state ==STATE_BORROWED) {
//			System.out.println(bookNo + "\t" + bookTitle + "(" + writer +"著) - 대출 중");
//		}
		String msg = getBookNo() + "\t" + getBookTitle() + "(" + getWriter() +"著) - ";
		//msg = msg + "대출중";
		msg += state == STATE_NORMAL ? "대출가능" : "대출 중";
		System.out.println(msg);
	}
	// getters
	public String getBorrower() {
		return borrower;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public byte getState() {
		return state;
	}
}














