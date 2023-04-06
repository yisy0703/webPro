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
	<h2>어떤 요청이 들어와도 cnt, list는 model에 add됨</h2>
	<h3>cnt : ${cnt }</h3>
	<h3>list : ${list }</h3>
	<%-- <form action="${conPath }/member/join1" method="get"> --%>
	<%-- <form action="${conPath }/member/join2" method="get"> --%>
	<%-- <form action="${conPath }/member/join3" method="get"> --%>
	<%-- <form action="${conPath }/member/join4" method="get"> --%>
	<%-- <form action="${conPath }/member/join5" method="post"> --%>
	<form action="${conPath }/member/join6" method="post">
		<table>
			<caption>개인 정보 입력</caption>
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw"></td></tr>
			<tr><th>나이</th><td><input type="number" name="age"></td></tr>
			<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
			<tr><th>주소</th><td><input type="text" name="address"></td></tr>
			<tr><th colspan="2"><input type="submit"></th></tr>
		</table>
	</form>
	<a href="${conPath }/studentId/aaa">studentId에 aaa로 전송</a><br>
	<a href="${conPath }/studentId/bbb">studentId에 bbb로 전송</a><br>
	<a href="${conPath }/studentId/홍길도">studentId에 홍길도로 전송</a><br>
	<a href="${conPath }/input.do">QUIZ(평가문제)</a>
</body>
</html>















