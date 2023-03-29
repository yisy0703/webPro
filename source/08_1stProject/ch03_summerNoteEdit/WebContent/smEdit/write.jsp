<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script>
				 $(document).ready(function() {
					 $('#summernote').summernote({
					        height: 300,
					        minHeight: null,
					        maxHeight: null,
					        lang : 'ko-KR',
					        onImageUpload: function(files, editor, welEditable) {
					                sendFile(files[0], editor, welEditable);
					            }
	
					    });
				 });
	</script>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
<form action="${conPath }/smEditwrite.do" method="post" enctype="multipart/form-data">
	<table>
		<caption>글쓰기</caption>
		<tr>
			<th>글제목</th>
			<td><input type="text" name="btitle" required="required"></td>
		</tr>
		<!-- <tr>
			<th>글본문</th>
			<td><textarea rows="5" cols="32" name="bcontent" id="bcontent"></textarea>
		</tr> -->
		<tr>
			<th>글본문</th>
		 	<td>
		 		<textarea id="summernote" name="bcontent" ></textarea>
		 	</td>
		 </tr>
		<tr>
			<th>첨부파일</th>
				<td><input type="file" name="bfile"></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center">
				<input type="submit" value="글쓰기">	
				<input type="button" value="목록" onclick="location.href='${conPath }/smEditList.do'">
			</th>
		</tr>
	</table>
</form>
</body>
</html>