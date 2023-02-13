<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h2>버퍼의 크기 : <%=out.getBufferSize() %>b</h2>
	<h2>버퍼의 남은 크기 : <%=out.getRemaining() %>b</h2>
	
	<%
		for(int i=0 ; i<300 ; i++){
			out.println("<h2>i =" + i +"번째 test에서 남은 버퍼 크기 : " + out.getRemaining()+"</h2>");
		}
	%>
</body>
</html>













