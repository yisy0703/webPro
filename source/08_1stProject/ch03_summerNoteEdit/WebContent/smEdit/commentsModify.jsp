<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="${conPath }/commentsModify.do">
		<input type="hidden" name="bno" value="${dto.bno }">
		<input type="hidden" name="cno" value="${dto.cno }">
		<textarea rows="2" cols="20" name="ccontent">${dto.ccontent}</textarea>
		<input type="submit" value="수정">
	</form>
</body>
</html>