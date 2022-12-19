package com.lec.quiz;
import java.util.ArrayList;
import java.util.Scanner;
public class CustomerArrayListMain {
	public static void main(String[] args) {
		ArrayList<Customer> customers = new ArrayList<Customer>();
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		do {
			System.out.print("회원가입 진행하시겠습니까 (Y/N)?");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("n")) {
				break;
			}else if(answer.equalsIgnoreCase("y")) {
//				Customer newCustomer = new Customer();
//				System.out.print("가입하실 회원님 이름은?");
//				newCustomer.setName(scanner.next());
//				System.out.print("가입하실 회원님 전화는?");
//				newCustomer.setTel(scanner.next());
//				System.out.print("가입하실 회원님 주소는?");
//				scanner.nextLine();// 버퍼지우는 용도
//				newCustomer.setAddress(scanner.nextLine());
//				customers.add(newCustomer);
				System.out.print("가입하실 회원님 이름은?");
				name = scanner.next();
				System.out.print("가입하실 회원님 전화번호는 ?");
				tel = scanner.next();
				System.out.print("가입하실 회원님 주소는 ?");
				scanner.nextLine(); // 버퍼지우는 용도
				address = scanner.nextLine();
				customers.add(new Customer(name, tel, address));
			}
		}while(true);
		scanner.close();
		// N(n)을 입력할 경우 회원정보 출력
		if(customers.size()==0) {
			System.out.println("가입한 회원 목록이 없습니다");
		}else {
			System.out.println("가입한 회원 목록입니다");
			for(Customer customer : customers) {
				System.out.println(customer);
			}
		}
	}
}






