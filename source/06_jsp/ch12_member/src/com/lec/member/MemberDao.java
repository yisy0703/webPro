package com.lec.member;
public class MemberDao {
	public static final int SUCCESS = 1; // 회원가입, 정보수정시 성공할 때 리턴값
	public static final int FAIL = 0; // 회원가입, 정보수정시 실패할 때 리턴값
	public static final int MEMBER_EXISTENT = 0; // 중복된 ID일 때 리턴값
	public static final int MEMBER_NONEXISTENT = 1; // 사용가능한 ID일 때 리턴값
	public static final int LOGIN_SUCCESS = 1; // 로그인 성공시 리턴값
	public static final int LOGIN_FAIL_PW = 0; // 로그인시 pw오류일 때 리턴값
	public static final int LOGIN_FAIL_ID = -1;// 로그인시 id오류일 때 리턴값
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	// 싱글톤
	private static MemberDao instance = new MemberDao(); // 자기가 자기 클래스형 객체를 참조
	public static MemberDao getInstance() {
//		if(instance==null) {
//			instance = new MemberDao();
//		}
		return instance;
	}
	private MemberDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
}








