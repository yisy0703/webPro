<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<form action="${conPath }/join.do" method="POST">
		<p><input type="text" name="id" placeholder="아이디"></p>
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="number" name="ageTemp" placeholder="나이"></p>
		<p><input type="date" name="birthTemp"> (생일)</p>
		<input type="submit" value="가입">
	</form>
</body>
</html>