package com.lec.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	// 1. 회원가입시 id 중복체크 : 
	public int confirmId(String id) {
		int result = MEMBER_EXISTENT; // 초기화
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 중복된 id라서 
				result = MEMBER_EXISTENT;
			}else {
				// 사용한 id(없는 id)
				result = MEMBER_NONEXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 2. 회원가입 : public int joinMember(MemberDto dto)
	// 3. 로그인 : public int loginCheck(String id, String pw)
	// 4. ID로 dto가져오기 : 로그인 성공시 session에 setAttribute / 회원정보 수정시 회원정보 가져오기
	//           : public MemberDto getMember(String id)
	// 5. 회원정보수정 : public int modifyMember(MemberDto dto)
}








