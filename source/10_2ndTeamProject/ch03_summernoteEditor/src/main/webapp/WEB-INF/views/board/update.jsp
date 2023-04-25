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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	
<script>
	$(document).ready(
	  function(){
		$('.bFilename').each(function(index, item){
			$(this).change(function(){
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				$(this).siblings('.bFile').val(filename);
			});
		}
	  );
	});
</script>
</head>
<body>
	<form action="${conPath }/update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table>
			<tr>
				<th>글번호</th><td><input type="text" name="bNo" value="${dto.bNo }" readonly="readonly"></td>				
			</tr>
			<tr>
				<th>글제목</th><td><input type="text" name="bTitle" value="${dto.bTitle }"></td>
			</tr>
			<!-- <tr>
				<th>글본문</th>
				<td><textarea rows="5" cols="32" name="bContent">${dto.bContent}</textarea>
			</tr> -->
			<tr>
				<th>글본문</th>
			 	<th>
			 		<textarea id="summernote" name="bContent" >${dto.bContent}</textarea>
			 		<script>
						 $(document).ready(function() {
							 $('#summernote').summernote({
							        height: 300,
							        minHeight: null,
							        maxHeight: null,
							        lang : 'ko-KR'/* ,
							        onImageUpload: function(files, editor, welEditable) {
							                sendFile(files[0], editor, welEditable);
							            } */
							    });
						 });
					</script>
				</th>
			</tr>
			<tr>
				<th>첨부파일1</th>
				<td>
					<input type="text" class="bFile btn" size="100" value="${not empty dto.bFile1? dto.bFile1:'첨부안됨'}">
					<label for="bfile1"><img src="${conPath }/img/upload.png"></label>
					<input type="file" id="bfile1" class="bFilename" name="tempBfile1" style="display: none;">
				</td>
			</tr>
			<tr>
				<th>첨부파일2</th>
				<td>
					<input type="text" class="bFile btn" size="100" value="${not empty dto.bFile2? dto.bFile2:'첨부안됨'}">
					<label for="bfile2"><img src="${conPath }/img/upload.png"></label>
					<input type="file" id="bfile2" class="bFilename" name="tempBfile2" style="display: none;">
				</td>
			</tr>
			<tr>
				<th>첨부파일3</th>
				<td>
					<input type="text" class="bFile btn" size="100" value="${not empty dto.bFile3? dto.bFile3:'첨부안됨'}">
					<label for="bfile3"><img src="${conPath }/img/upload.png"></label>
					<input type="file" id="bfile3" class="bFilename" name="tempBfile3" style="display: none;">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="목록" onclick="location.href='${conPath}/list.do'" class="btn">
					<button onclick="location.href='${conPath}/delete.do?pageNum=${param.pageNum}&bno=${detail.bno }'" class="btn">삭제</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>