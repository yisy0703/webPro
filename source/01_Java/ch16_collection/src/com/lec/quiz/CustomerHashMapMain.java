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
			System.out.print("회원가입 진행하시겠습니까 (Y/N)?");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("y")) {
//				Customer newCustomer = new Customer();
//				System.out.print("가입하실 회원님 이름은?");
//				newCustomer.setName(scanner.next());
//				System.out.print("가입하실 회원님 전화는?");
//				tel = scanner.next();
//				// 기존에 가입한 전화번호인지 확인하는 방법
//				if(customers.get(tel)!=null) {
//					System.out.println("이미 가입되어 있는 전화번호입니다. 전호번호는 중복하여 가입 불가합니다");
//					continue;
//				}
//				newCustomer.setTel(tel);
//				System.out.print("가입하실 회원님 주소는?");
//				scanner.nextLine();// 버퍼지우는 용도
//				newCustomer.setAddress(scanner.nextLine());
//				customers.put(tel, newCustomer);
				System.out.print("가입하실 회원님 이름은?");
				name = scanner.next();
				System.out.print("가입하실 회원님 전화번호는 ?");
				tel = scanner.next();
				// 기존에 가입한 전화번호인지 확인하는 방법
				if(customers.get(tel) != null) {
					System.out.println("이미 가입되어 있는 전화번호입니다. 전호번호는 중복하여 가입 불가합니다");
					continue;
				}
				System.out.print("가입하실 회원님 주소는 ?");
				scanner.nextLine(); // 버퍼지우는 용도
				address = scanner.nextLine();
				customers.put(tel, new Customer(name, tel, address));
			}
		}while(!answer.equalsIgnoreCase("n"));
		scanner.close();
		// N(n)을 입력할 경우 회원정보 출력
		if(customers.isEmpty()) {
			System.out.println("가입한 회원 목록이 없습니다");
		}else {
			System.out.println("가입한 회원 목록입니다");
			Iterator<String> iterator = customers.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(customers.get(key));
			}
		}
	}
}


