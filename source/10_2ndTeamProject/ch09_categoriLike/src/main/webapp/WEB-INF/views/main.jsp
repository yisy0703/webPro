<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		button { border: 1px solid #cccccc; background-color: #dddddd; padding: 20px; border-radius: 10px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<c:if test="${empty member }">
		<h1>손님 어서오세요</h1>
		<button onclick="location.href='${conPath}/login'">로그인</button>
	</c:if>
	<c:if test="${not empty member }">
		
		<h1>${member.mname }(${member.mid })님 어서오세요</h1>
		<button onclick="location.href='${conPath}/loginOut'">로그아웃</button>
		<button onclick="location.href='${conPath}/categoryList'">카테고리 리스트로</button>
	</c:if>
</body>
</html>