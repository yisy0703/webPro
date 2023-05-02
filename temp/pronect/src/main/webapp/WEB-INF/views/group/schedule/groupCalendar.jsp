<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<html>
	<head>
	</head>
	<body>
  	<h2>일정 추가</h2>
  	시작일 <input type="date" name="start"> 종료일 <input type="date" name="end">
  	일정명 <input type="text" name="title" class="inputBox" style="width: 40%;">
  	<h2>댓글</h2>
  	<textarea class="inputBox"></textarea>
  </body>
</html>