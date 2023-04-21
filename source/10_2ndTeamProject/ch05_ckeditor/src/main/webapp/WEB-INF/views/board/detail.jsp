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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<table>
		<tr><th>글제목</th><td>${detail.btitle }</td></tr>
		<tr><th>글내용</th>
				<td><div>${detail.bcontent }</div></td>
		</tr>
		<tr><th>첨부파일</th>
				<td>
					<c:if test="${not empty detail.bfile }"><a href="${conPath }/fileUp/${detail.bfile}" target="_blank">${detail.bfile }</a></c:if>
					<c:if test="${empty detail.bfile }">첨부파일 없음</c:if>
				</td>
		</tr>
		<tr><td colspan="2">
			<button onclick="location.href='${conPath}/list.do?pageNum=${param.pageNum}'">목록</button>
			<button onclick="location.href='${conPath}/updateForm.do?pageNum=${param.pageNum}&bno=${detail.bno }'">수정</button>
			<button onclick="location.href='${conPath}/delete.do?pageNum=${param.pageNum}&bno=${detail.bno }'">삭제</button>
		</td></tr>
	</table>
</body>
</html>