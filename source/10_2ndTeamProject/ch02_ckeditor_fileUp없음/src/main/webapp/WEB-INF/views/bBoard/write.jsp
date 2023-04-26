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
	<script src="${conPath }/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function() {
			CKEDITOR.replace('bcontent', {
				filebrowserUploadUrl : '${conPath }/fileupload.do'
			});
		});
	</script>
	<script>
		$(document).ready(function(){
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<form action="${conPath }/bBoard/write.do"  method="post">
		<table>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="btitle" required="required"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="30" name="bcontent"></textarea>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글쓰기" class="btn"></td>
			</tr>
		</table>
	</form>
</body>
</html>