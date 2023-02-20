<%@page import="com.lec.member.MemberDaoConn"%>
<%@page import="com.lec.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>테스트 페이지</h1>
	<%
		MemberDaoConn dao = new MemberDaoConn();
		String id = "bbb";
		int result = dao.confirmId(id);
		if(result == MemberDaoConn.MEMBER_EXISTENT){
			out.println("<h3>1. confirmId결과 : " + id+"는 있는 아이디입니다. 회원가입 불가합니다</h3>");
		}else{
			out.println("<h3>1. confirmId결과 : " + id + "는 없는 아이디입니다. 회원가입 가능합니다</h3>");
			MemberDto dto = new MemberDto(id, "111", "김길동", null, null, null, null,
					null, null, null, null);
			result = dao.joinMember(dto);
			if(result == MemberDaoConn.SUCCESS){
				out.println("<h3>2. join 결과 : 회원가입 성공");
			}else{
				out.println("<h3>2. join 결과 : 회원가입 실패 : " + dto);
			}
		}
		out.println("<h3>3. 로그인 결과 :");
		result = dao.loginCheck("aaa", "111");
		if(result == MemberDaoConn.LOGIN_SUCCESS){
			out.println(": aaa - 111 로그인 성공 </h3>");
		}else if(result == MemberDaoConn.LOGIN_FAIL_PW){
			out.println(": aaa - 111 : pw 오류로 로그인 실패 </h3>");
		}else if(result == MemberDaoConn.LOGIN_FAIL_ID){
			out.println(": aaa - 111 : id 오류로 로그인 실패 </h3>");
		}
		
		out.println("<h3>3. 로그인 결과 :");
		result = dao.loginCheck("aaa", "222");
		if(result == MemberDaoConn.LOGIN_SUCCESS){
			out.println(": aaa - 222 로그인 성공 </h3>");
		}else if(result == MemberDaoConn.LOGIN_FAIL_PW){
			out.println(": aaa - 222 : pw 오류로 로그인 실패 </h3>");
		}else if(result == MemberDaoConn.LOGIN_FAIL_ID){
			out.println(": aaa - 222 : id 오류로 로그인 실패 </h3>");
		}
		
		out.println("<h3>3. 로그인 결과 :");
		result = dao.loginCheck("abc", "222");
		if(result == MemberDaoConn.LOGIN_SUCCESS){
			out.println(": abc - 222 로그인 성공 </h3>");
		}else if(result == MemberDaoConn.LOGIN_FAIL_PW){
			out.println(": abc - 222 : pw 오류로 로그인 실패 </h3>");
		}else if(result == MemberDaoConn.LOGIN_FAIL_ID){
			out.println(": abc - 222 : id 오류로 로그인 실패 </h3>");
		}
		out.println("<h3>4. id로 dto가져오기</h3>");
		MemberDto dto = dao.getMember("aaa");
		out.println("aaa 아이디인 member : " + dto + "<br>");
		dto = dao.getMember("qqq");
		out.println("qqq 아이디인 member : " + dto + "<br>");
		out.println("<h3>5. 정보 수정 </h3>");
		dto = new MemberDto("aaa", "111", "나몰라", null, null, null, null,
				"north@hong.com", null, "북한", null);
		result = dao.modifyMember(dto);
		if(result == MemberDaoConn.SUCCESS){
			out.println("수정완료<br>");
			out.println("db의 수정된 데이터 :" + dao.getMember(dto.getId()) +"<br>");
		}else{
			out.println(dto.getId()+" 아이디는 없어서 수정 못했어요<br>");
		}
	%>
</body>
</html>

















