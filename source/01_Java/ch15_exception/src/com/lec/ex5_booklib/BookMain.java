package com.lec.ex5_booklib;
import java.util.Scanner;
public class BookMain {
	public static void main(String[] args) {
		Book[] books = {new Book("890ㅁ-01-11", "java","홍길동"),
						new Book("890ㅁ-01-12", "oracle","오길동"),
						new Book("890ㅁ-02-01", "mysql","마길동"),
						new Book("890ㅁ-01-01", "jdbc","제이디"),
						new Book("890ㅁ-01-01", "html","이에이")};
		Scanner scanner = new Scanner(System.in);
		String fn;  // 기능번호 (1:대출/2:반납/3:책list/0:종료)
		int idx; // 대출하거나 반납할 때, 조회된 책의 index
		String bTitle, borrower; // 사용자에게 받을 책이름, 대출인
		do {
			System.out.print("0:책list / 1:대출 /  2:반납 /  그외:종료");
			fn = scanner.next();
			switch(fn) {
			case "1": // 대출 : 1.책이름입력 2.책조회 3.책상태확인 4.대출인입력 5.대출일입력 6.대출메소드 호출
				// 1. 책이름입력
				System.out.print("대출하고자 하는 책이름은?");
				bTitle = scanner.next(); // white-space 앞까지의 스트링만 받음
				// 2.책조회
				for(idx=0 ; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle()) ) {
						break;
					}
				}// for
				if(idx == books.length) {
					System.out.println("현재 보유하지 않는 도서입니다");
				}else { // books[idx] 도서를 대출
					// 3.책상태확인
					if(books[idx].getState() == Book.STATE_BORROWED) {
						System.out.println("현재 대출 중인 도서입니다");
					}else {
						// 4.대출인입력
						System.out.print("대출인은 ? ");
						borrower = scanner.next();
						// 5.대출일입력 안받아
						// 6.대출메소드 호출
						books[idx].checkOut(borrower);
					}//if - 상태확인
				}// if - 도서 조회
				break;
			case "2": // 반납로직 : 1.책이름입력 2.책조회 3.반납메소드 호출
				// 1. 책이름입력
				System.out.print("반납하고자 하는 책이름은?");
				bTitle = scanner.next(); // white-space 앞까지의 스트링만 받음
				// 2.책조회
				for(idx=0 ; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle()) ) {
						break;
					}
				}// for
				if(idx == books.length) {
					System.out.println("해당 도서는 본 도서관의 책이 아닙니다");
				}else {
					// 3. 반납메소드 호출
					try {
						books[idx].checkIn();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
				break;
			case "0": // 책 list 출력 : for문을 이용하여 출력
				for(Book book : books) {
					System.out.println(book);
				}
			}
		}while(fn.equals("0") || fn.equals("1") || fn.equals("2"));
		System.out.println("0, 1, 2외 입력 시 종료");
		scanner.close();
	}
}