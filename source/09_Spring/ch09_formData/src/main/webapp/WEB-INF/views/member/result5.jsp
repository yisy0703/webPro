<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>모든 요청에서 cnt, list 출력 가능</h2>
	<h3>cnt : ${cnt }</h3>
	<h3>list : ${list }</h3>
	<h2>result4.jsp페이지 개인 정보 (member/join5 결과)</h2>
	<h3>이름 : ${memberDto.name }</h3>
	<h3>아이디 : ${memberDto.id }</h3>
	<h3>비밀번호 : ${memberDto.pw }</h3>
	<h3>나이 : ${memberDto.age }</h3>
	<h3>이메일 : ${memberDto.email }</h3>
	<h3>주소 : ${memberDto.address }</h3>
</body>
</html>
















