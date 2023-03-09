<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.ex.dto.MemberDto"%>
<%@page import="com.lec.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
<%
	MemberDao dao = MemberDao.getInstance();
	out.println("<h3>1.회원id중복체크</h3>");
	if(MemberDao.EXISTENT == dao.midConfirm("bbb")){
		out.println("bbb는 중복된 ID");
	}else if(MemberDao.NONEXISTENT == dao.midConfirm("bbb")){
		out.println("bbb는 사용가능한 ID");
	}
	out.println("<h3>2.회원가입</h3>");
	int result = dao.joinMember(new MemberDto("eee","1","홍길",null,"NOIMG.JPG",null, null,null));
	if(result == MemberDao.SUCCESS){
		out.println("회원가입 성공");
	}else if(result == MemberDao.FAIL){
		out.println("회원가입 실패");
	}
	out.println("<h3>3.로그인</h3>");
	result = dao.loginCheck("aaa", "1");
	if(result == MemberDao.LOGIN_SUCCESS){
		out.println("<p>aaa-1 로그인성공</p>");
	}
	result = dao.loginCheck("aaa", "9");
	if(result == MemberDao.FAIL){
		out.println("<p>aaa - 9 로그인실패</p>");
	}
	out.println("<h3>4.mid로 dto가져오기</h3>");
	MemberDto member = dao.getMember("aaa");
	out.println("<p>"+member+"</p>");
%>
</body>
</html>