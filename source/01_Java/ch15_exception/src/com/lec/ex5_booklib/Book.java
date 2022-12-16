package com.lec.ex5_booklib;
import java.util.Date;
// Book book = new Book("890��-01-11", "java","ȫ�浿")
public class Book implements ILendable {
	private String bookNo;    // å��ȣ
	private String bookTitle; // å�̸�
	private String writer;    // ����
	private String borrower;  // ������
	private Date checkOutDate; // ������
	private byte state;          // ���Ⱑ��(0), ������(1)
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	@Override
	public void checkOut(String borrower) {
		if(state == STATE_BORROWED) { // �������̸� �޼��� �Ѹ��� ��
			System.out.println(bookTitle + " ������ �������Դϴ�");
			return;
		}
		// state�� 0(STATE_NORMAL)�̶� ���� ����
		this.borrower = borrower;
		checkOutDate = new Date();
		state = STATE_BORROWED; // "������" ���·� ��ȯ
		System.out.println(bookTitle + " ������ ���� ó�� �Ǿ����ϴ�");
		System.out.println("������ : " + borrower +"\t������:"+checkOutDate);
	}
	@Override
	public void checkIn() throws Exception{
		if(state==STATE_NORMAL) {
			System.out.println(bookTitle +" ������ �ݳ��Ϸ�� å�Դϴ�. Ȯ���ϼ���"); //X
			return; //X
		}
		// checkOutDate�� ����������� ��¥ ���
		// ��ü�� ��� -> ��ü�� �´��� ���ο� ���� 
		// state�� ������(1:STATE_BORROWED)�̶� �ݳ� ó��
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + " ������ �ݳ� �Ϸ�Ǿ����ϴ�");
	}
	@Override
	public String toString() {
		String msg = bookNo + "\t" + bookTitle + "(" + writer +"��) - ";
		//msg = msg + "������";
		msg += state == STATE_NORMAL ? "���Ⱑ��" : "���� ��";
		return msg;
	}
	// getters
	public String getBookNo() {
		return bookNo;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public String getWriter() {
		return writer;
	}
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














