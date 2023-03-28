<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
</head>
<body>
	<c:if test="${not empty error }">
		<script>alert('${error}');</script>
	</c:if>
	<c:if test="${empty error }">
		<c:forEach var="dto" items="${friendList }">
			<div class="tr${dto.no }">
				<table>
					<tr>
						<td>${dto.no }</td>
						<td id="name${dto.no }">${dto.name }</td>
						<td id="tel${dto.no }">${dto.tel }</td>
						<td id="addr${dto.no }">${dto.addr }</td>
						<td><button class="modify" id="${dto.no }" id="${dto.no }">수정</button></td>
					</tr>
				</table>
			</div>
		</c:forEach>
		<input type="hidden" name="pageNum" class="pageNum" value="${pageNum }">
	</c:if>
</body>
</html>