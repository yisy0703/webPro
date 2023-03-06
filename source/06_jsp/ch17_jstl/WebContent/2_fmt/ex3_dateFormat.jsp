<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()) %>"/>
	<c:set var="nowTimes" value="<%=new Timestamp(System.currentTimeMillis()) %>"/>
	<c:set var="nowDateUtil" value="<%=new java.util.Date() %>"/>
	${nowDate }<br>
	${nowTimes }<br>
	${nowDateUtil }<br>
	<hr>
	<h4>날짜만 출력</h4>
	short : <fmt:formatDate value="${nowDate }" type="date" dateStyle="short"/><br>
	short : <fmt:formatDate value="${nowTimes }" type="date" dateStyle="short"/><br>
	short : <fmt:formatDate value="${nowDateUtil }" type="date" dateStyle="short"/><br>
	medium : <fmt:formatDate value="${nowDate }" type="date" dateStyle="medium"/><br>
	long : <fmt:formatDate value="${nowDate }" type="date" dateStyle="long"/><br>
	full : <fmt:formatDate value="${nowDate }" type="date" dateStyle="full"/><br>
	<h4>시간만 출력</h4>
	short : <fmt:formatDate value="${nowDate }" type="time" timeStyle="short"/><br> 
	medium :<fmt:formatDate value="${nowDate }" type="time" timeStyle="medium"/><br> 
	long : <fmt:formatDate value="${nowDate }" type="time" timeStyle="long"/><br> 
	full : <fmt:formatDate value="${nowDate }" type="time" timeStyle="full"/><br> 
	<h4>날짜와 시간 모두 출력</h4>
	<fmt:formatDate value="${nowDate }" type="both" dateStyle="medium" timeStyle="short"/><br>
</body>
</html>

















