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
				System.out.print("가입할 회원님 전화번호 : ");
				String ctel = scanner.next();
				System.out.print("가입할 회원님 이름 : ");
				String cname = scanner.next();
				//int result = dao.insertCustomer(ctel, cname);
				int result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
				System.out.println(result==CustomerDao.SUCCESS? cname+"님 회원가입 감사. 포인트 1000점 넣음":
																												cname+"님 회원가입 실패");
				break;
			case "2":
				System.out.print("검색할 전화번호 뒷4자리나 전화번호전체 : ");
				String searchTel = scanner.next();
				customers = dao.ctelGetCustomers(searchTel);
				if(customers.isEmpty()) {
					System.out.println(searchTel+"전화번호로 검색된 고객이 없습니다. 회원가입 하세요");
				}else {
					System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					for(CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "3":
				System.out.print("고객아이디 (고객아이디를 모를 경우, 검색하세요) :");
				int cid = scanner.nextInt();
				System.out.print("물품가격 : ");
				int price = scanner.nextInt();
				result = dao.buy(cid, price);
				if(result==CustomerDao.SUCCESS) {
					System.out.println("물품구매 감사합니다 "+price+"원 구매하여 고객님 데이터가 아래와 같이 업그레이드");
					CustomerDto customer = dao.getCustomer(cid);
					System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					System.out.println(customer);
				}else {
					System.out.println(cid+"는 유효한 고객아이디가 아닙니다");
				}
				break;
			case "4":
				System.out.print("검색하고자 하는 레벨"+dao.getLevelNames() +" : ");
				String levelName = scanner.next();
				customers = dao.levelNameGetCustomers(levelName);
				if(customers.size()==0) {
					System.out.println("해당 레벨 " + levelName +"은 고객이 검색되지 않습니다");
				}else {
					System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					for(CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "5":
				customers = dao.getCustomers();
				if(customers.isEmpty()) {
					System.out.println("고객이 검색되지 않습니다");
				}else {
					System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					for(CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "6":
				System.out.print("탈퇴할 고객 전화번호 : ");
				ctel = scanner.next();
				result = dao.deleteCustomer(ctel);
				System.out.println(result==CustomerDao.SUCCESS? "탈퇴가 완료되었습니다":"유효한 전화번호가 아닙니다");
			}
		}while(fn.equals("1") || fn.equals("2") || fn.equals("3") || 
						fn.equals("4") || fn.equals("5") || fn.equals("6"));
		System.out.println("BYE");
	}
}