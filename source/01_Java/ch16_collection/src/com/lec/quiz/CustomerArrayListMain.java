package com.lec.quiz;
import java.util.ArrayList;
import java.util.Scanner;
public class CustomerArrayListMain {
	public static void main(String[] args) {
		ArrayList<Customer> customers = new ArrayList<Customer>();
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		do {
			System.out.print("ȸ������ �����Ͻðڽ��ϱ� (Y/N)?");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("n")) {
				break;
			}else if(answer.equalsIgnoreCase("y")) {
//				Customer newCustomer = new Customer();
//				System.out.print("�����Ͻ� ȸ���� �̸���?");
//				newCustomer.setName(scanner.next());
//				System.out.print("�����Ͻ� ȸ���� ��ȭ��?");
//				newCustomer.setTel(scanner.next());
//				System.out.print("�����Ͻ� ȸ���� �ּҴ�?");
//				scanner.nextLine();// ��������� �뵵
//				newCustomer.setAddress(scanner.nextLine());
//				customers.add(newCustomer);
				System.out.print("�����Ͻ� ȸ���� �̸���?");
				name = scanner.next();
				System.out.print("�����Ͻ� ȸ���� ��ȭ��ȣ�� ?");
				tel = scanner.next();
				System.out.print("�����Ͻ� ȸ���� �ּҴ� ?");
				scanner.nextLine(); // ��������� �뵵
				address = scanner.nextLine();
				customers.add(new Customer(name, tel, address));
			}
		}while(true);
		scanner.close();
		// N(n)�� �Է��� ��� ȸ������ ���
		if(customers.size()==0) {
			System.out.println("������ ȸ�� ����� �����ϴ�");
		}else {
			System.out.println("������ ȸ�� ����Դϴ�");
			for(Customer customer : customers) {
				System.out.println(customer);
			}
		}
	}
}






