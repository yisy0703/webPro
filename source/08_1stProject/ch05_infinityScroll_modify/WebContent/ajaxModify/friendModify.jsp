<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
	
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<table>
		<tr>
			<td>${modifyFriend.no }</td>
			<td id="name${modifyFriend.no }">${modifyFriend.name }</td>
			<td id="tel${modifyFriend.no }">${modifyFriend.tel }</td>
			<td id="addr${modifyFriend.no }">${modifyFriend.addr }</td>
			<td><button class="modify" id="${modifyFriend.no }" id="${modifyFriend.no }">수정</button></td>
		</tr>
	</table>
</body>
</html>