<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<link href="${conPath }/css/style.css" rel="stylesheet">
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
</head>
<body>
<form action="${conPath }/smEditModify.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bno" value="${dto.bno }">
	<input type="hidden" name="dbBfile" value="${dto.bfile }">
	<table>
		<caption>${param.bno }번 글 수정</caption>
		<tr><th>글제목</th>
				<td><input type="text" name="btitle" required="required" value="${dto.btitle }"></td>
		</tr>
		<!-- <tr><th>글본문</th>
				<td><textarea rows="5" cols="32" name="bcontent" id="bcontent"></textarea>
		</tr> -->
		<tr><th>글본문</th>
		 <th>
		 <textarea id="summernote" name="bcontent" >${dto.bcontent }</textarea>
		 </th>
		 </tr>
		<tr><th>첨부파일</th>
				<td><input type="file" name="bfile"></td>
		<tr><td colspan="2"><input type="submit" value="글수정">	
				<input type="button" value="목록" onclick="location.href='${conPath }/smEditlist.do'">
				</td>
		</tr>
	</table>
</form>
</body>
</html>