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
<form action="${conPath }/noEditwrite.do" method="post" enctype="multipart/form-data">
	<table>
		<caption>글쓰기</caption>
		<tr><th>글제목</th>
				<td><input type="text" name="btitle" required="required"></td>
		</tr>
		<tr><th>글본문</th>
				<td><textarea rows="5" cols="32" name="bcontent" ></textarea>
		</tr>
		<tr><th>첨부파일</th>
				<td><input type="file" name="bfile"></td>
		<tr><td colspan="2"><input type="submit" value="글쓰기">	
				<input type="button" value="목록" onclick="location.href='${conPath }/noEditList.do'">
				</td>
		</tr>
	</table>
</form>
</body>
</html>