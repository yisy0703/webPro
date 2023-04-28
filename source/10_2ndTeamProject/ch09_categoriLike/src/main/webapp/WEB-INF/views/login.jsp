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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<c:if test="${not empty member }">
		<script>location.href='${conPath}/categoryList';</script>
	</c:if>
	<c:if test="${not empty failMsg }">
		<script>alert('${failMsg}');</script>
	</c:if>
	<form action="login" method="post">
		<input type="hidden" name="after" value="${not empty param.after? param.after : '/' }">
		<table>
			<tr><th>아이디</th><td><input type="text" name="mid"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="mpw"></td></tr>
			<tr><td colspan="2"><input type="submit" value="로그인"></td></tr>
		</table>
	</form>
</body>
</html>