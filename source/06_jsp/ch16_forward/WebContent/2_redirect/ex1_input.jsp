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
	<form action="<%=conPath %>/ex1_servlet">
		<P>ID <input type="text" name="id"></P>
		<P>PW <input type="password" name="pw"></P>
		<P>NAME <input type="text" name="name"></P>
		<input type="submit" value="확인">
	</form>
</body>
</html>














