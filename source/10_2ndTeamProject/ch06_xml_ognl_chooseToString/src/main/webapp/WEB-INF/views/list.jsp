<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${result eq 1 }">
		<script>
			swal('${no}번','친구 등록 완성','success');
		</script>
	</c:if>
	
	<table>
		<tr>
			<th colspan="6">
				<a href="${conPath }/join.do">친구 등록</a>
			</th>
		</tr>
		<c:if test="${listFriend.size() eq 0 }">
			<tr>
				<td colspan="6">
						등록된 친구가 없습니다.
					</td>
			</tr>
		</c:if>
		<c:forEach items="${listFriend }" var="friend">
			<tr>
				<td>${friend.no }</td>
				<td>${friend.name }</td>
				<td>${friend.category=='A' ? '<b>친구</b>':'지인'}</td>
				<td>${empty friend.years ? '-': friend.years}</td>
				<td>${friend.tel }</td>
			</tr>
		</c:forEach>
			
	</table>
</body>
</html>