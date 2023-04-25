<%@page import="java.sql.Date"%>
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
				var bNo = $(this).children(0).eq(1).text();
				if(!isNaN(bNo)){
					location.href='${conPath}/board/detail.do?bNo='+bNo;
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty param.resultMsg }">
		<script>
			alert('${param.resultMsg}');
		</script>
	</c:if>
	<c:set var="no" value="1"/>
	<table>
		<tr><td colspan="6"><a href="${conPath }/board/write.do">글쓰기</a></td></tr>
		<tr>
			<th>순번</th>
			<th>글번호</th>
			<th>글제목</th>
			<th>파일1첨부여부</th>
			<th>파일2첨부여부</th>
			<th>파일1첨부여부</th>
		</tr>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${no }</td>
				<td>${dto.bNo }</td>
				<td>${dto.bTitle }</td>
				<td>
					<c:if	test="${not empty dto.bFile1}"><img src="${conPath }/img/file.gif" alt="파일있음"></c:if>
					<c:if	test="${empty dto.bFile1}">X</c:if>
				</td>
				<td>
					<c:if	test="${not empty dto.bFile2}"><img src="${conPath }/img/file.gif" alt="파일있음"></c:if>
					<c:if	test="${empty dto.bFile2}">X</c:if>
				</td>
				<td>
					<c:if	test="${not empty dto.bFile3}"><img src="${conPath }/img/file.gif" alt="파일있음"></c:if>
					<c:if	test="${empty dto.bFile3}">X</c:if>
				</td>
			</tr>
			<c:set var="no" value="${no+1 }"/>
		</c:forEach>
	</table>
</body>
</html>