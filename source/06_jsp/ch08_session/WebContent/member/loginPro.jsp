<%@page import="java.net.URLEncoder"%>
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
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// DB에 id와 pw 확인 작업 : SELECT * FROM MEMBER WHERE ID=? and pw=?
		if(id==null || !id.equals("aaa") || pw==null || !pw.equals("111")){
			response.sendRedirect("login.jsp?msg=");
		}else{
			session.setAttribute("id", id);
			session.setAttribute("name", "홍길동");
			response.sendRedirect("main.jsp");
		}
	%>
</body>
</html>














