<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${joinResult eq SUCCESS }">
		<script>alert('회원가입 성공');</script>
	</c:if>
	<c:if test="${joinResult eq FAIL }">
		<script>alert('회원가입 실패');</script>
	</c:if>
	<table>
		<tr><th>번호</th><th>ID</th><th>PW</th><th>이름</th><th>생일</th><th>가입</th></tr>
		<c:if test="${memberList.size() eq 0 }">
			<tr><td colspan="6">가입한 회원이 없습니다</td>
		</c:if>
		<c:if test="${memberList.size() != 0 }">
			<c:set var="no" value="1"/>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${no }</td>
					<td>${member.id }</td>
					<td>${member.pw }</td>
					<td>${member.name }</td>
					<td>
						<fmt:formatDate value="${member.birth }" pattern="MM월 dd일"/>
					</td>
					<td>
						<fmt:formatDate value="${member.rdate }" pattern="YY-MM-dd hh:mm(a)"/>
					</td>
				</tr>
				<c:set var="no" value="${no + 1 }"/>
			</c:forEach>
		</c:if>
	</table>
	<p>
	<button onclick="location.href='${conPath}/memberJoinView.do'">회원가입</button>
	</p>
</body>
</html>











