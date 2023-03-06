<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>예외 처리</h2>
	<c:catch var="e"> <!-- c:catch절에서 예외가 발생할 경우, 예외타입과 예외메세지가 e변수 저장 -->
		<h2>테스트</h2>
		${8/0 }
		<p>예외가 발생되는 즉시 c:catch절을 빠져나감. 이 p태그 출력시 예외가 발생 안 된 것임</p>
	</c:catch>
	예외타입과 예외 메세지 : <c:out value="${e }" default="예외 발생 안 됨"/>
</body>
</html>
















