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
		String pageNum = request.getParameter("pageNum");
		int fnum = Integer.parseInt(request.getParameter("fnum"));
		String fpw = request.getParameter("fpw");
		FileboardDao fbDao = FileboardDao.getInstance();
		int result = fbDao.deleteBoard(fnum, fpw);
		if(result == FileboardDao.SUCCESS){
	%>	
			<script>
				alert('<%=fnum%>번 글 삭제 성공');
				location.href = 'fboardList.jsp?pageNum=<%=pageNum%>';
			</script>	
	<%}else{%>
			<script>
				alert('<%=fnum%>번 글 삭제 실패. 비번을 확인하세요');
				history.go(-1);
			</script>	
	<%}%>
</body>
</html>