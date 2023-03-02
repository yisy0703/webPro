<%@page import="com.lec.ex.Member"%>
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
	<%
		Member member = new Member("aaa","111","김길동");
	%>
	<h1>회원정보(getter이요)</h1>
	<h3>member : <%=member %></h3>
	<h3>ID : <%=member.getId() %></h3>
	<h3>PW : <%=member.getPw() %></h3>
	<h3>name : <%=member.getName() %></h3>
	<h1>회원정보(el표기법)</h1>
	<h3>member : ${member }</h3>
	<h3>ID : ${member.id }</h3>
	<h3>PW : ${member.pw }</h3>
	<h3>name : ${member.name }</h3>
</body>
</html>
















