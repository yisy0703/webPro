package com.lec.ex5_booklib;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd��(E)");
		System.out.println(bookTitle + " ������ ���� ó�� �Ǿ����ϴ�");
		System.out.println("������ : " + borrower +"\t������:"+sdf.format(checkOutDate));
	}
	@Override
	public void checkIn() throws Exception{
		if(state==STATE_NORMAL) {
			throw new Exception("�� "+bookTitle +" ������ �ݳ��Ϸ�� å�Դϴ�. Ȯ���ϼ���");
		}
		// checkOutDate�� ����������� ��¥ ���
		Date now = new Date();
		long term = now.getTime() - checkOutDate.getTime();
		long day = term / (1000*60*60*24);
		// ��ü�� ��� -> ��ü�� �´��� ���ο� ���� 
		if(day>14) {
			System.out.println(bookTitle + "���� ��ü�Ǿ����ϴ�. ��ü�� ���� 100�� �ΰ��մϴ�");
			System.out.println("���ž� �� ��ü��� " + ((day-14)*100)+"��");
			Scanner sc = new Scanner(System.in);
			System.out.print(bookTitle + "���� ��ü�Ḧ ���̳���(y/n)?");
			if(!sc.next().trim().equalsIgnoreCase("y")) {
				System.out.println(bookTitle + "���� ��ü�Ḧ ���ž� �ݳ�ó���� �˴ϴ�. ��ü�Ḧ �� ������");
				return;
			}//if - ��ü��
		}//if - ��ü
		// state�� ������(1:STATE_BORROWED)�̶� �ݳ� ó��
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println(bookTitle + " ������ �ݳ� �Ϸ�Ǿ����ϴ�");
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd��(E)");
		String msg = bookNo + "\t" + bookTitle + "(" + writer +"��) - ";
		msg += state == STATE_NORMAL ? "���Ⱑ�� " : "���� �� "+sdf.format(checkOutDate);
		return msg;
	}
	// getters & setter
	public String getBookTitle() {return bookTitle;	}
	public byte getState() {return state;}
	public void setCheckOutDate(Date checkOutDate) {this.checkOutDate = checkOutDate;}
}














