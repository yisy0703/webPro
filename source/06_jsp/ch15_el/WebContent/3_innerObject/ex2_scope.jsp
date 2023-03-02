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
	<h1>회원정보(ex2_scope.jsp파일)</h1>
	<h3>ID ${param.id }</h3>
	<h3>PW ${param.pw }</h3>
	<h3>name ${param.name }</h3>
	<hr>
	<h3>페이지 내 attribute : ${pageScope.pageName }</h3>
	<h3>request 내 attribute : ${requestScope.requestName }</h3>
	<h3>session 내 attribute : ${sessionScope.sessionName }</h3>
	<h3>application 내 attribute : ${applicationScope.applicationName }</h3>
	<hr>
	<h3>페이지 내 attribute : ${pageName }</h3>
	<h3>request 내 attribute : ${requestName }</h3>
	<h3>session 내 attribute : ${sessionName }</h3>
	<h3>application 내 attribute : ${applicationName }</h3>
</body>
</html>















