package com.lec.ex3supermarket;
public class CustomerDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public final static int SUCCESS = 1;
	public final static int FAIL    = 0;
	// dao�� �̱������� ����/ private �����ڿ��� driver�ε�
	
	// 1. ȸ������ : public int insertCustomer(String ctel, String cname)
  // public int insertCustomer(CustomerDto dto)
	// 2. ����4�ڸ�(Ǯ��ȣ) �˻�  : 
	// public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
	// 3. ��ǰ���� : public int buy(int cid, int price)
	// 3�� ��ǰ���� �� ������ ���� ��� : public CustomerDto getCustomer(int cid)
	// 4�� �� levelName�� ���� ���� : public ArrayList<String> getLevelNames()
	// 4. ��޺� �� ��� : public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
	// 5. ��ü ��� : public ArrayList<CustomerDto> getCustomers()
	// 6. ȸ��Ż�� : public int deleteCustomer(String ctel)
}
