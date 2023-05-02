<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		function confirmSubmit(){
		    Swal.fire({
		        title: '댓글 수정을 완료하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm2').submit();
		        }
		    });
		    return false;
		}
	</script>
</head>
<body>
	<br>
	<div>
		<form id="frm2" action="${conPath}/fcomment/modify.do" onsubmit="return confirmSubmit();">
			<input type="hidden" name="fcid" value="${fcomment.fcid }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="commentPageNum" value="${param.commentPageNum}">
			<input type="hidden" name="fid" value="${fcomment.fid}">
			<c:forEach var="i" begin="1" end="${fcomment.fcindent }">
				<c:if test="${i==fcomment.fcindent }">
					&nbsp; &nbsp; &nbsp; └
				</c:if>
				<c:if test="${i!=fcomment.fcindent }">
					&nbsp; &nbsp; &nbsp; 
				</c:if>
			</c:forEach>
			<span style="display:block; height:30px; float:left; margin: 5px;">${fcomment.fcid }.</span>
			
			<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:30px; float:left; margin: 5px;">${fcomment.fccontent }</textarea>
			<input type="submit" value="수정" class="btn" style="height:30px; float:left; margin: 5px;">
		</form>
	</div>
	<p style="clear:both;"></p>
	<br>
</body>
</html>