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
	<h1>회원정보(ex1_view.jsp)</h1>
	<h3>회원 : <%=request.getAttribute("member") %></h3>
	<h3>회원 : ${member }</h3>
	<h3>ID : ${member.id }</h3>
	<h3>PW : ${member.pw }</h3>
	<h3>name : ${member.name }</h3>
</body>
</html>













