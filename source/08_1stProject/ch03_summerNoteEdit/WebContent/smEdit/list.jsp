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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(function(){
			$('tr').click(function(){
				var bno = Number($(this).children().eq(0).text());
				if(!isNaN(bno)){
					location.href = '${conPath }/smEditcontent.do?bno='+bno;
				}
			});
			/*$('body').click(function(){
				if(event.button==0){
					alert('복사안되요');
				}
			});*/
		});
	</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<table><tr><td><a href="smEditwriteView.do">글쓰기</a></td></tr></table>
	<table>
		<tr><th>글번호</th><th>글제목</th><th>파일</th></tr>
		<c:forEach var="dto" items="${list }">
			<tr><td>${dto.bno }</td>
				<td>${dto.btitle }</td>
				<td>
					<c:if test="${empty dto.bfile }">첨부파일없음</c:if>
					<c:if test="${not empty dto.bfile }">${dto.bfile }</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>
	이 화면은 드레그 해서 복사가 안 되요
</body>
</html>