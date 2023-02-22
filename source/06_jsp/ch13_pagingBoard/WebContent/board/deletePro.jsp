<%@page import="com.lec.dao.BoardDao"%>
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
		int num = Integer.parseInt(request.getParameter("num"));
		String pw = request.getParameter("pw");
		BoardDao bDao = BoardDao.getInstance();
		int result = bDao.deleteBoard(num, pw);
		if(result == BoardDao.SUCCESS){
	%>		
			<script>
				alert('<%=num%>번 글 삭제 완료');
				location.href = '<%=conPath%>/board/list.jsp';
			</script>
	<%}else{%>
			<script>
				alert('<%=num%>번 글 삭제 실패. 비밀번호를 확인하세요');
				history.back();
			</script>
	<%}%>	
</body>
</html>















