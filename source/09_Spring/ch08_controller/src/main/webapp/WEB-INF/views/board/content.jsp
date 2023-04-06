<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<h3>board의 content.jsp입니다</h3>
	<h4>ID : ${id }</h4>
	<h4>ID : ${pw }</h4>
	<h4>member : ${member }(toString()결과)</h4>
	<h5>member.id : ${member.id }</h5>
	<h5>member.pw : ${member.pw }</h5>
	<hr>
	<h3 onclick="history.go(-1);">이젠페이지로 가기</h3>
</body>
</html>













