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
<script src="${conPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('bcontent', {
			filebrowserUploadUrl : '${conPath }/fileupload.do'
		});
	});
</script>
<script>
	$(document).ready(
			function() {
				$('#bfile').change(function() {
							if (window.FileReader) {
								var filename = $(this)[0].files[0].name;
							} else {
								var filename = $(this).val().split('/').pop()
										.split('\\').pop();
							}
							$(this).siblings('.bfile').val(filename);
						});
			});
</script>
</head>
<body>
	<form action="${conPath }/write.do"  method="post" enctype="multipart/form-data">
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
				<th>첨부파일</th>
				<td><input type="text" class="bfile" class="btn"> &nbsp;
						<label for="bfile"><img src="${conPath }/img/upload.png"></label>
						<input type="file" id="bfile" name="tempBfile" style="display: none;">
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>