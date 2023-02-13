<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%-- ex3_param.jsp?n=1 --%>
	<h1>ex3_param.jsp입니다</h1>
	<jsp:forward page="ex4.jsp">
		<jsp:param name="id" value="aaa"/>
		<jsp:param name="pw" value="111"/>
	</jsp:forward>
</body>
</html>
















