<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<c:if test="${nicknameConfirmResult eq 1 }">
		<b style="color:red">중복된 닉네임입니다. 다른 닉네임을 입력해주세요</b>
	</c:if>
	<c:if test="${nicknameConfirmResult eq 0 }">
		사용 가능한 닉네임입니다
	</c:if>
</body>
</html>