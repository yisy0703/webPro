<%@page import="com.lec.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
<%
	// midConfirm.jsp?mid=go
	String mid = request.getParameter("mid");
	MemberDao mDao = MemberDao.getInstance();
	int result = mDao.midConfirm(mid);
	if(result == MemberDao.EXISTENT){
		out.println("<b>중복된 ID입니다</b>");
	}else{
		out.println("사용 가능한 ID입니다");
	}
%>
</body>
</html>










