package com.lec.ex3supermarket;
import java.util.ArrayList;
import java.util.Scanner;
public class SuperMng {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		Scanner scanner = new Scanner(System.in);
		String fn;
		ArrayList<CustomerDto> customers;
		do {
			System.out.print("1:ȸ������, 2:����2�ڸ�(FULL)�˻�, 3:��ǰ����, 4:���������, 5:��ü���,"
											+ " 6:Ż��, �׿�:���� ��");
			fn = scanner.next();
			switch(fn) {
			case "1":
				System.out.println("ctel�� cname�޾� insert");
				break;
			case "2":
				System.out.println("�˻�");
				break;
			case "3":
				System.out.println("��ǰ����");
				break;
			case "4":
				System.out.println("������ ���");
				break;
			case "5":
				System.out.println("�� ���");
				break;
			case "6":
				System.out.println("Ż��");
			}
		}while(fn.equals("1") || fn.equals("2") || fn.equals("3") || 
						fn.equals("4") || fn.equals("5") || fn.equals("6"));
		System.out.println("BYE");
	}
}















