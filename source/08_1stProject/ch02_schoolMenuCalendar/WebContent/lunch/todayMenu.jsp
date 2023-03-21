<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('button').click(function(){
				close();
			});
		});
	</script>
</head>
<body>
	<h4>급식열람 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <button>X</button></h4>
	<hr>
	<table>
		<tr><th>급식</th><td>${dto.ampm }</td></tr>
		<tr><th>배식일</th><td>${dto.ldate }</td></tr>
		<tr><th>메뉴</th><td>${dto.menu }</td></tr>
		<tr><th>칼로리</th><td>${dto.calorie }</td></tr>
		<tr>
			<th>식단이미지</th>
			<td>
				<c:if test="${empty dto.photo }">
					<img src="${conPath }/lunchPhoto/noImg.png">
				</c:if>
				<c:if test="${not empty dto.photo }">
					<img src="${conPath }/lunchPhoto/${dto.photo}">
				</c:if>
			</td>
	</table>
</body>
</html>