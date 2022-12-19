package com.lec.quiz;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
public class CustomerHashMapMain {
	public static void main(String[] args) {
		HashMap<String, Customer> customers = new HashMap<String, Customer>();
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
//				tel = scanner.next();
//				// ������ ������ ��ȭ��ȣ���� Ȯ���ϴ� ���
//				if(customers.get(tel)!=null) {
//					System.out.println("�̹� ���ԵǾ� �ִ� ��ȭ��ȣ�Դϴ�. ��ȣ��ȣ�� �ߺ��Ͽ� ���� �Ұ��մϴ�");
//					continue;
//				}
//				newCustomer.setTel(tel);
//				System.out.print("�����Ͻ� ȸ���� �ּҴ�?");
//				scanner.nextLine();// ��������� �뵵
//				newCustomer.setAddress(scanner.nextLine());
//				customers.put(tel, newCustomer);
				System.out.print("�����Ͻ� ȸ���� �̸���?");
				name = scanner.next();
				System.out.print("�����Ͻ� ȸ���� ��ȭ��ȣ�� ?");
				tel = scanner.next();
				// ������ ������ ��ȭ��ȣ���� Ȯ���ϴ� ���
				if(customers.get(tel) != null) {
					System.out.println("�̹� ���ԵǾ� �ִ� ��ȭ��ȣ�Դϴ�. ��ȣ��ȣ�� �ߺ��Ͽ� ���� �Ұ��մϴ�");
					continue;
				}
				System.out.print("�����Ͻ� ȸ���� �ּҴ� ?");
				scanner.nextLine(); // ��������� �뵵
				address = scanner.nextLine();
				customers.put(tel, new Customer(name, tel, address));
			}
		}while(!answer.equalsIgnoreCase("n"));
		scanner.close();
		// N(n)�� �Է��� ��� ȸ������ ���
		if(customers.isEmpty()) {
			System.out.println("������ ȸ�� ����� �����ϴ�");
		}else {
			System.out.println("������ ȸ�� ����Դϴ�");
			Iterator<String> iterator = customers.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(customers.get(key));
			}
		}
	}
}


