<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(function(){
			
		});
	</script>
</head>
<body>
	<table>
		<caption>${dto.bno } 글 자세히 보기</caption>
		<tr><th>글 제목</th>
				<td>${dto.btitle }</td>
		</tr>
		<tr><th>글 본문</th>
				<td><pre>${dto.bcontent }</pre></td>
		</tr>
		<tr><th>첨부파일</th>
				<td>
					<c:if test="${empty dto.bfile }">첨부파일없음</c:if>
					<c:if test="${not empty dto.bfile }">
						<a href="img/${dto.bfile }" target="_blank">${dto.bfile }</a>
					</c:if>
				</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="history.back()">이전</button>
				<button onclick="location='${conPath }/noEditList.do'">목록</button>
			</td>
		</tr>
	</table>
</body>
</html>