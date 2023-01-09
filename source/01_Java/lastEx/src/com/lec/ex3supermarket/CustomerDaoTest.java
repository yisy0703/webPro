package com.lec.ex3supermarket;
import java.util.ArrayList;
public class CustomerDaoTest {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		int result;
		ArrayList<CustomerDto> customers;
//		System.out.println("=== 1. ȸ������ ===");
		String ctel = "010-1111-111", cname="�̼���";
//		result = dao.insertCustomer(ctel, cname);
//		System.out.println(result==CustomerDao.SUCCESS? cname+"�� ȸ������ ����. ����Ʈ1000�� �־� �帲":
//																										cname+"�� ȸ������ ����");
//		ctel="010-2222-1111"; cname="������";
//		result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
//		System.out.println(result==CustomerDao.SUCCESS? cname+"�� ȸ������ ����. ����Ʈ1000�� �־� �帲":
//																										cname+"�� ȸ������ ����");
		System.out.println("=== 2. ��ȭ��ȣ �˻� ===");
		ctel = "9999";
		customers = dao.ctelGetCustomers(ctel);
		if(customers.isEmpty()) {
			System.out.println(ctel+" ��ȭ��ȣ�� �˻��� ���� �����ϴ�. ȸ�������ϼ���");
		}else {
			System.out.println("���̵�\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t��������������õ���ž�");
			for(CustomerDto customer : customers) {
				System.out.println(customer);
			}
		}//if
		System.out.println("=== 3. ��ǰ���� ===");
		result = dao.buy(1, 200000); // 1�� ���� 20���� ����
		if(result==CustomerDao.SUCCESS) { // ��ǰ���Ű� �����Ǹ� �����޼����� �Բ� �� ���� ���
			CustomerDto customer = dao.getCustomer(1); 
			System.out.println("��ǰ���� �����մϴ�. ���� ������ �Ʒ��� ���� ������Ʈ �Ǿ����ϴ�");
			System.out.println("���̵�\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t��������������õ���ž�");
			System.out.println(customer);
		}else {
			System.out.println("cid�� ��ȿ���� �ʽ��ϴ�");
		}
		System.out.println("=== 4. ������ ��� ===");
		System.out.println("�������� : " + dao.getLevelNames());
	}
}














