package com.lec.ex3supermarket;
import java.util.ArrayList;
public class CustomerDaoTest {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		int result;
		ArrayList<CustomerDto> customers;
//		System.out.println("=== 1. 회원가입 ===");
		String ctel = "010-1111-111", cname="이순신";
//		result = dao.insertCustomer(ctel, cname);
//		System.out.println(result==CustomerDao.SUCCESS? cname+"님 회원가입 감사. 포인트1000점 넣어 드림":
//																										cname+"님 회원가입 실패");
//		ctel="010-2222-1111"; cname="강감찬";
//		result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
//		System.out.println(result==CustomerDao.SUCCESS? cname+"님 회원가입 감사. 포인트1000점 넣어 드림":
//																										cname+"님 회원가입 실패");
		System.out.println("=== 2. 전화번호 검색 ===");
		ctel = "9999";
		customers = dao.ctelGetCustomers(ctel);
		if(customers.isEmpty()) {
			System.out.println(ctel+" 전화번호로 검색된 고객이 없습니다. 회원가입하세요");
		}else {
			System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}
		}//if
		System.out.println("=== 3. 물품구매 ===");
		result = dao.buy(1, 200000); // 1번 고객이 20만원 구매
		if(result==CustomerDao.SUCCESS) { // 물품구매가 성공되면 성공메세지와 함께 고객 정보 출력
			CustomerDto customer = dao.getCustomer(1); 
			System.out.println("물품구매 감사합니다. 고객님 정보는 아래와 같이 업데이트 되었습니다");
			System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
			System.out.println(customer);
		}else {
			System.out.println("cid가 유효하지 않습니다");
		}
		System.out.println("=== 4. 레벨별 출력 ===");
		System.out.println("고객레벨명 : " + dao.getLevelNames());
		customers = dao.levelNameGetCustomers("NORMAL");
		if(customers.size()==0) {
			System.out.println("NORMAL 레벨 고객이 없습니다.");
		}else {
			System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}
		}
		System.out.println("=== 5. 전체 출력 ===");
		customers = dao.getCustomers();
		if(customers.isEmpty()) {
			System.out.println("고객이 없습니다.");
		}else {
			System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}//for
		}//if
		System.out.println("=== 6. 회원탈퇴 ===");
		result = dao.deleteCustomer("010-7777-7777");
		System.out.println(result==CustomerDao.SUCCESS? "삭제성공":"유효한 전화번호가 아닙니다");
		System.out.println("=== 5. 전체 출력 ===");
		customers = dao.getCustomers();
		if(customers.isEmpty()) {
			System.out.println("고객이 없습니다.");
		}else {
			System.out.println("아이디\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}//for
		}//if
	}
}














