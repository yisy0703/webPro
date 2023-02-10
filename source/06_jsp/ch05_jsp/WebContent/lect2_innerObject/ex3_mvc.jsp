<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body> 
	<a href="<%=conPath %>/writer.do">글쓰기</a>
	<button onclick="location.href='<%=conPath%>/delete.do'">회원탈퇴</button>
	<form action="<%=conPath%>/memberLogin.do">
		<input type="text" name="id" placeholder="ID를 입력"><br>
		<input type="password" name="pw" placeholder="pw를 입력"><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='<%=conPath%>/join.do'">
	</form>
</body>
</html>
















