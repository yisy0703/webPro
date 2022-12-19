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
			System.out.print("회원가입 진행하시겠습니까 (Y/N)?");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("y")) {
//				Customer newCustomer = new Customer();
//				System.out.print("가입하실 회원님 이름은?");
//				newCustomer.setName(scanner.next());
//				System.out.print("가입하실 회원님 전화는?");
//				newCustomer.setTel(scanner.next());
//				System.out.print("가입하실 회원님 주소는?");
//				scanner.nextLine();// 버퍼지우는 용도
//				newCustomer.setAddress(scanner.nextLine());
//				// 기존에 가입한 회원인지 확인
//				boolean joinChk = true;
//				Iterator<Customer> iterator = customers.iterator();
//				while(iterator.hasNext()) {
//					if(iterator.next().equals(newCustomer)) {
//						System.out.println("이미 가입된 회원정보가 존재합니다.");
//						joinChk = false;
//						break;
//					}
//				}// while
//				if(joinChk) {
//					customers.add(newCustomer);
//				}
				System.out.print("가입하실 회원님 이름은?");
				name = scanner.next();
				System.out.print("가입하실 회원님 전화번호는 ?");
				tel = scanner.next();
				System.out.print("가입하실 회원님 주소는 ?");
				scanner.nextLine(); // 버퍼지우는 용도
				address = scanner.nextLine();
				Customer newCustomer = new Customer(name, tel, address);
				boolean joinChk = true;
				Iterator<Customer> iterator = customers.iterator();
				while(iterator.hasNext()) {
					if(iterator.next().equals(newCustomer)) {
						System.out.println("이미 가입된 회원정보가 존재합니다.");
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
			System.out.println("가입한 회원 목록이 없습니다");
		}else {
			System.out.println("가입한 회원 목록입니다");
			Iterator<Customer> iterator = customers.iterator();
			while(iterator.hasNext()) {
				System.out.println(iterator.next());
			}
		}
	}
}