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
	<form action="${conPath }/replyModify.do">
		<input type="hidden" name="bno" value="${dto.bno }">
		<input type="hidden" name="rno" value="${dto.rno }">
		<textarea rows="2" cols="20" name="rcontent">${dto.rcontent}</textarea>
		<input type="submit" value="수정">
	</form>
</body>
</html>