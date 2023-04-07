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
	<h1>studentNg 페이지입니다</h1>
	<h2>
		confirm 실패된 ID :
		<c:if test="${empty id }">
			X (model의 id가 없음: 바로실행. redirect를 쓸 경우)
		</c:if>
		<c:if test="${not empty id }">
			${id }(model의 id가 있음 : forward를 쓸 경우)
		</c:if>
	</h2>
	<h2>
		파라미터로 넘어온 ID :
		<c:if test="${empty param.id }">
			X (파라미터 id가 없음 : 바로 실행. redirect를 쓸 경우)
		</c:if>
		<c:if test="${not empty param.id }">
			${param.id }(파라미터 id가 남아있음 : forward를 쓸 경우)
		</c:if>
	</h2>
</body>
</html>














