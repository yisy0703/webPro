<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
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
		FileboardDao fDao = FileboardDao.getInstance();
		FileboardDto fbDto = new FileboardDto();
		for(int i=0 ; i<=70 ; i++){
			// 글 등록
		}
	%>
</body>
</html>













