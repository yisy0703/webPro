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
	<form action="ex07_result.jsp">
		<input type="number" name="n1" value="<%=(int)(Math.random()*10)+1 %>" 
						readonly="readonly">
		+
		<input type="number" name="n2" value="<%=(int)(Math.random()*10)+1 %>" 
						readonly="readonly">
		=
		<input type="number" name="n3" placeholder="정답을 입력하세요">
		<input type="submit" value="확인">
	</form>
</body>
</html>













