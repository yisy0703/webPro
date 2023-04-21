<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<table>
		<tr><th>글제목</th><td>${bBoard.btitle }</td></tr>
		<tr><th>글내용</th>
				<td><div>${bBoard.bcontent }</div></td>
		</tr>
		<tr><th>첨부파일</th>
				<td>
					<c:if test="${not empty bBoard.bfile }"><a href="${conPath }/fileUp/${bBoard.bfile}" target="_blank">${bBoard.bfile }</a></c:if>
					<c:if test="${empty bBoard.bfile }">첨부파일 없음</c:if>
				</td>
		</tr>
		<tr><td colspan="2">
			<button onclick="location.href='${conPath}/listBboard.do?pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button>
			<button onclick="location.href='${conPath}/updateBboard.do?bno=${detail.bno }&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
			<button onclick="location.href='${conPath}/deleteBboard.do?bno=${detail.bno }&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}'">삭제</button>
		</td></tr>
	</table>
</body>
</html>