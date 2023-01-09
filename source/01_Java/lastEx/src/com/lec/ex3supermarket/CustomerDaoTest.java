package com.lec.ex3supermarket;
import java.util.ArrayList;
public class CustomerDaoTest {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		int result;
		ArrayList<CustomerDto> customers;
		System.out.println("=== 1. 회원가입 ===");
		String ctel = "010-1111-111", cname="이순신";
		result = dao.insertCustomer(ctel, cname);
		System.out.println(result==CustomerDao.SUCCESS? cname+"님 회원가입 감사. 포인트1000점 넣어 드림":
																										cname+"님 회원가입 실패");
		ctel="010-2222-1111"; cname="강감찬";
		result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
		System.out.println(result==CustomerDao.SUCCESS? cname+"님 회원가입 감사. 포인트1000점 넣어 드림":
																										cname+"님 회원가입 실패");
	}
}














