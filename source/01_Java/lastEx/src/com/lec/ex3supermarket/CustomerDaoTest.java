package com.lec.ex3supermarket;
import java.util.ArrayList;
public class CustomerDaoTest {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		int result;
		ArrayList<CustomerDto> customers;
		System.out.println("=== 1. ȸ������ ===");
		String ctel = "010-1111-111", cname="�̼���";
		result = dao.insertCustomer(ctel, cname);
		System.out.println(result==CustomerDao.SUCCESS? cname+"�� ȸ������ ����. ����Ʈ1000�� �־� �帲":
																										cname+"�� ȸ������ ����");
		ctel="010-2222-1111"; cname="������";
		result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
		System.out.println(result==CustomerDao.SUCCESS? cname+"�� ȸ������ ����. ����Ʈ1000�� �־� �帲":
																										cname+"�� ȸ������ ����");
	}
}














