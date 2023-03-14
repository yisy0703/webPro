<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty errorMsg }">
		<script>
			alert('${errorMsg }');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty member }">
		<h1>${member.name }님 어서오세요</h1>
		<hr>
		<button onclick="location.href='${conPath}/logout.do'">로그아웃</button>
	</c:if>
	<c:if test="${empty member }">
		<h1>손님 어서오세요</h1>
		<hr>
		<button onclick="location.href='${conPath}/loginView.do'">로그인</button>
		<button onclick="location.href='${conPath}/joinView.do'">회원가입</button>
	</c:if>
</body>
</html>