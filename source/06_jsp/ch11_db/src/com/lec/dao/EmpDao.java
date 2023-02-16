package com.lec.dao;

public class EmpDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String uid    = "scott";
	private String upw    = "tiger";
	private static EmpDao instance; // 자기 클래스를 참조하는 변수
	public static EmpDao getInstance() {
		if(instance == null) {
			instance = new EmpDao();
		}
		return instance;
	}
	private EmpDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	// detpno로 empList를 반환
	
	// searchName으로 empList를 반환
}















