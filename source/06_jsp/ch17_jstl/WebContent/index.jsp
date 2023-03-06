<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1><a href="${conPath }/empList">EmpList</a></h1>
	<!-- EmpList.java(서블릿, 프로세스), empList.jsp(뷰) : 함께 -->
	<h1><a href="${conPath }/empSch">empSch(이름과 job으로 검색한 list만 출력)</a></h1>
	<!-- EmpSch.java(서블릿, 프로세스), empSch.jsp(뷰) : 여러분 -->
</body>
</html>









