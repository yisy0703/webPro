package com.lec.quiz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;

public class CustomerHashSetMain {
	public static void main(String[] args) {
		HashSet<Customer> customers = new HashSet<Customer>();
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		do {
			System.out.print("ȸ������ �����Ͻðڽ��ϱ� (Y/N)?");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("y")) {
//				Customer newCustomer = new Customer();
//				System.out.print("�����Ͻ� ȸ���� �̸���?");
//				newCustomer.setName(scanner.next());
//				System.out.print("�����Ͻ� ȸ���� ��ȭ��?");
//				newCustomer.setTel(scanner.next());
//				System.out.print("�����Ͻ� ȸ���� �ּҴ�?");
//				scanner.nextLine();// ��������� �뵵
//				newCustomer.setAddress(scanner.nextLine());
//				// ������ ������ ȸ������ Ȯ��
//				boolean joinChk = true;
//				Iterator<Customer> iterator = customers.iterator();
//				while(iterator.hasNext()) {
//					if(iterator.next().equals(newCustomer)) {
//						System.out.println("�̹� ���Ե� ȸ�������� �����մϴ�.");
//						joinChk = false;
//						break;
//					}
//				}// while
//				if(joinChk) {
//					customers.add(newCustomer);
//				}
				System.out.print("�����Ͻ� ȸ���� �̸���?");
				name = scanner.next();
				System.out.print("�����Ͻ� ȸ���� ��ȭ��ȣ�� ?");
				tel = scanner.next();
				System.out.print("�����Ͻ� ȸ���� �ּҴ� ?");
				scanner.nextLine(); // ��������� �뵵
				address = scanner.nextLine();
				Customer newCustomer = new Customer(name, tel, address);
				boolean joinChk = true;
				Iterator<Customer> iterator = customers.iterator();
				while(iterator.hasNext()) {
					if(iterator.next().equals(newCustomer)) {
						System.out.println("�̹� ���Ե� ȸ�������� �����մϴ�.");
						joinChk = false;
						break;
					}
				}// while
				if(joinChk) {
					customers.add(newCustomer);
				}
			}
		}while(!answer.equalsIgnoreCase("n"));
		scanner.close();
		if(customers.isEmpty()) {
			System.out.println("������ ȸ�� ����� �����ϴ�");
		}else {
			System.out.println("������ ȸ�� ����Դϴ�");
			Iterator<Customer> iterator = customers.iterator();
			while(iterator.hasNext()) {
				System.out.println(iterator.next());
			}
		}
	}
}