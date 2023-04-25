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
	$(document).ready(function() {
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
	$(document).ready(function(){
		$('.deleteBboardBtn').click(function(){
			location.href='${conPath}/bBoard/delete.do?bno=${param.bno }&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';
		});
		$('.listBboardBtn').click(function(){
			location.href='${conPath}/bBoard/list.do?pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';
		});
	});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<form action="${conPath }/bBoard/update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="schItem" value="${param.schItem }">
		<input type="hidden" name="schWord" value="${param.schWord }">
		<table>
			<tr>
				<th>글번호</th><td><input type="text" name="bno" value="${updateDto.bno }" readonly="readonly"></td>				
			</tr>
			<tr>
				<th>글제목</th><td><input type="text" name="btitle" value="${updateDto.btitle }"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="30" name="bcontent">${updateDto.bcontent }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="text" class="bfile" class="btn" value="${updateDto.bfile}" style="display: block; float: left; width:90%;">
					<label for="bfile"><img src="${conPath }/img/upload.png"></label>
					<input type="file" id="bfile" name="tempBfile" style="display:none;">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="삭제" class="btn deleteBboardBtn">
					<input type="button" value="목록" class="btn listBboardBtn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>