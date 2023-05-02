<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<c:if test="${idConfirmResult eq 1 }">
		<b style="color:red">중복된 ID입니다. 다른 ID를 입력해주세요</b>
	</c:if>
	<c:if test="${idConfirmResult eq 0 }">
		사용 가능한 ID입니다
	</c:if>
</body>
</html>