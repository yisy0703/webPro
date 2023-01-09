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
			System.out.print("1:회원가입, 2:폰뒷2자리(FULL)검색, 3:물품구매, 4:레벨별출력, 5:전체출력,"
											+ " 6:탈퇴, 그외:종료 ☞");
			fn = scanner.next();
			switch(fn) {
			case "1":
				System.out.println("ctel과 cname받아 insert");
				break;
			case "2":
				System.out.println("검색");
				break;
			case "3":
				System.out.println("물품구매");
				break;
			case "4":
				System.out.println("레벨별 출력");
				break;
			case "5":
				System.out.println("다 출력");
				break;
			case "6":
				System.out.println("탈퇴");
			}
		}while(fn.equals("1") || fn.equals("2") || fn.equals("3") || 
						fn.equals("4") || fn.equals("5") || fn.equals("6"));
		System.out.println("BYE");
	}
}















