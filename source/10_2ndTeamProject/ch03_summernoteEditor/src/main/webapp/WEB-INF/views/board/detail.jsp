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
<body oncontextmenu="return false" 
ondragstart="return false" onselectstart="return false">
	<table>
		<tr><th>글제목</th><td>${dto.bTitle }</td></tr>
		<tr><th>글내용</th>
				<td><div><pre>${dto.bContent }</pre></div></td>
		</tr>
		<tr><th>첨부파일</th>
				<td>
					<c:if test="${not empty dto.bFile1 }"><a href="${conPath }/fileUp/${dto.bFile1}" target="_blank">${dto.bFile1 }</a></c:if>
					<c:if test="${empty dto.bFile1 }">첨부파일1 없음</c:if><br>
					<c:if test="${not empty dto.bFile2 }"><a href="${conPath }/fileUp/${dto.bFile2}" target="_blank">${dto.bFile2 }</a></c:if>
					<c:if test="${empty dto.bFile2 }">첨부파일2 없음</c:if><br>
					<c:if test="${not empty dto.bFile3 }"><a href="${conPath }/fileUp/${dto.bFile3}" target="_blank">${dto.bFile3 }</a></c:if>
					<c:if test="${empty dto.bFile3 }">첨부파일3 없음</c:if><br>
				</td>
		</tr>
		<tr><td colspan="2">
			<button onclick="location.href='${conPath}/board/list.do?pageNum=${param.pageNum}'">목록</button>
			<button onclick="location.href='${conPath}/board/update.do?pageNum=${param.pageNum}&bNo=${dto.bNo }'">수정</button>
			<button onclick="location.href='${conPath}/board/delete.do?pageNum=${param.pageNum}&bNo=${dto.bNo }'">삭제</button>
		</td></tr>
	</table>
	<br>
	* 본 페이지는 복사가 불가합니다
</body>
</html>