<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('tr').click(function(){
				id = $(this).children(0).eq(0).text();
				location.href = '${conPath}/detail?id='+id;
			});
		});
	</script>
</head>
<body>
	<table>
		<tr>
			<th>ID</th><th>PW</th><th>이름</th><th>메일</th><th>생일</th><th>가입일</th><th>주소</th>
		</tr>
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.id }</td>
				<td>${member.pw }</td>
				<td>${member.name }</td>
				<td>${member.email }</td>
				<td><fmt:formatDate value="${member.birth }" pattern="yy/MM/dd(E)"/> </td>
				<td>${member.rdate }</td>
				<td>${member.address }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>