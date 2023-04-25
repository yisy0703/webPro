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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote.js"></script>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	
<script>
	$(document).ready(function(){
		$('.bFilename').each(function(index, item){
			$(this).change(function(){
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
				} else {
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				$(this).siblings('.bFile').val(filename);
			});
		});
	});
</script>
</head>
<body>
	<form action="${conPath }/write.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>글제목</th><td><input type="text" name="bTitle"></td>
			</tr>
			<!-- <tr><th>글본문</th>
				<td><textarea rows="5" cols="32" name="bcontent" id="bcontent">${updateDto.bcontent}</textarea>
			</tr> -->
			<tr>
				<th>글본문</th>
			 	<td style="text-align: left">
					<textarea id="summernote" name="bContent" ></textarea>
				 	<script>
						$(document).ready(function() {
							$('#summernote').summernote({
						  	height: 300,     // 에디터 높이
						    minHeight: null, // 최소 높이
						    maxHeight: null, // 최대 높이
						    placeholder : '자유롭게 본문을 입력하세요',
						    lang : 'ko-KR' /* , 
						    onImageUpload: function(files, editor, welEditable) {
						    	sendFile(files[0], editor, welEditable);
						    }  */
						   });
					 });
				 </script>
			</td>
			</tr>
			<tr>
				<th>첨부파일1</th>
					<td>
						<input type="text" class="bFile btn" style="width: 90%;"> &nbsp;
						<label for="bFile1"><img src="${conPath }/img/upload.png"></label>
						<input type="file" id="bFile1" class="bFilename" name="tempBfile1" style="display: none;">
					</td>
			</tr>
			<tr>
				<th>첨부파일2</th>
					<td>
						<input type="text" class="bFile btn" style="width: 90%;"> &nbsp;
						<label for="bFile2"><img src="${conPath }/img/upload.png"></label>
						<input type="file" id="bFile2" class="bFilename" name="tempBfile2" style="display: none;">
					</td>
			</tr>
			<tr>
				<th>첨부파일3</th>
					<td>
						<input type="text" class="bFile btn" style="width: 90%;"> &nbsp;
						<label for="bFile3"><img src="${conPath }/img/upload.png"></label>
						<input type="file" id="bFile3" class="bFilename" name="tempBfile3" style="display: none;">
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="쓰기" class="btn">
					<input type="button" value="목록" onclick="location.href='${conPath}/list.do'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>