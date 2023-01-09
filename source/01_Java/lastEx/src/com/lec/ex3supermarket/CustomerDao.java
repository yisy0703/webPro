package com.lec.ex3supermarket;
public class CustomerDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public final static int SUCCESS = 1;
	public final static int FAIL    = 0;
	// dao는 싱글톤으로 구현/ private 생성자에는 driver로드
	
	// 1. 회원가입 : public int insertCustomer(String ctel, String cname)
  // public int insertCustomer(CustomerDto dto)
	// 2. 폰뒤4자리(풀번호) 검색  : 
	// public ArrayList<CustomerDto> ctelGetCustomers(String searchTel)
	// 3. 물품구입 : public int buy(int cid, int price)
	// 3번 물품구입 후 구매자 정보 출력 : public CustomerDto getCustomer(int cid)
	// 4번 전 levelName들 정보 추출 : public ArrayList<String> getLevelNames()
	// 4. 등급별 고객 출력 : public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)
	// 5. 전체 출력 : public ArrayList<CustomerDto> getCustomers()
	// 6. 회원탈퇴 : public int deleteCustomer(String ctel)
}
