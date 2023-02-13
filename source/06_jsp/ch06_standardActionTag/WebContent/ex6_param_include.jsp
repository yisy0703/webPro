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
	<h1>ex6_param_include.jsp파일입니다</h1>
	<hr>
	<jsp:include page="ex4.jsp">
		<jsp:param value="1" name="n"/>
		<jsp:param value="aaa" name="id"/>
		<jsp:param value="111" name="pw"/>
	</jsp:include>
	<hr>
	<h1>다시 ex6_param_include.jsp파일입니다</h1>
</body>
</html>














