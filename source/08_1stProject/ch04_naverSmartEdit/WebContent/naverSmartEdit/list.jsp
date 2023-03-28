<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(function(){
			$('tr').click(function(){
				var bno = Number($(this).children().eq(0).text());
				if(!isNaN(bno)){
					location.href = '${conPath }/naverSmartEditcontent.do?bno='+bno;
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty result }">
		<script>swal('','${result }','success');</script>
	</c:if>
	<table><tr><td><a href="naverSmartEditwriteView.do">글쓰기</a></td></tr></table>
	<table>
		<tr><th>글번호</th><th>글제목</th><th>파일</th></tr>
		<c:forEach var="dto" items="${bList }">
			<tr><td>${dto.bno }</td>
				<td>${dto.btitle }[${dto.cnt }]</td>
				<td>
					<c:if test="${empty dto.bfile }">첨부파일없음</c:if>
					<c:if test="${not empty dto.bfile }">${dto.bfile }</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>
</body>
</html>