package com.lec.ex5_booklib;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
// Book book = new Book("890ㅁ-01-11", "java","홍길동")
public class Book implements ILendable {
	private String bookNo;    // 책번호
	private String bookTitle; // 책이름
	private String writer;    // 저자
	private String borrower;  // 대출인
	private Date checkOutDate; // 대출일
	private byte state;          // 대출가능(0), 대출중(1)
	
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	@Override
	public void checkOut(String borrower) {
		if(state == STATE_BORROWED) { // 대출중이면 메세지 뿌리고 끝
			System.out.println(bookTitle + " 도서는 대출중입니다");
			return;
		}
		// state가 0(STATE_NORMAL)이라서 대출 진행
		this.borrower = borrower;
		checkOutDate = new Date();
		state = STATE_BORROWED; // "대출중" 상태로 전환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일(E)");
		System.out.println(bookTitle + " 도서가 대출 처리 되었습니다");
		System.out.println("대출인 : " + borrower +"\t대출일:"+sdf.format(checkOutDate));
	}
	@Override
	public void checkIn() throws Exception{
		if(state==STATE_NORMAL) {
			throw new Exception("★ "+bookTitle +" 도서는 반납완료된 책입니다. 확인하세요");
		}
		// checkOutDate와 현재시점간의 날짜 계산
		Date now = new Date();
		long term = now.getTime() - checkOutDate.getTime();
		long day = term / (1000*60*60*24);
		// 연체료 출력 -> 연체료 냈는지 여부에 따라 
		if(day>14) {
			System.out.println(bookTitle + "대출 연체되었습니다. 연체료 일일 100원 부가합니다");
			System.out.println("내셔야 할 연체료는 " + ((day-14)*100)+"원");
			Scanner sc = new Scanner(System.in);
			System.out.print(bookTitle + "도서 연체료를 내셨나요(y/n)?");
			if(!sc.next().trim().equalsIgnoreCase("y")) {
				System.out.println(bookTitle + "도서 연체료를 내셔야 반납처리가 됩니다. 연체료를 꼭 내세요");
				return;
			}//if - 연체료
		}//if - 연체
		// state가 대출중(1:STATE_BORROWED)이라 반납 처리
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + " 도서가 반납 완료되었습니다");
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일(E)");
		String msg = bookNo + "\t" + bookTitle + "(" + writer +"著) - ";
		msg += state == STATE_NORMAL ? "대출가능 " : "대출 중 "+sdf.format(checkOutDate);
		return msg;
	}
	// getters & setter
	public String getBookTitle() {return bookTitle;	}
	public byte getState() {return state;}
	public void setCheckOutDate(Date checkOutDate) {this.checkOutDate = checkOutDate;}
}














