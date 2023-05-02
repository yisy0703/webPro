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
	<link href="${conPath }/css/main.css" rel="stylesheet">
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
		        title: '대댓글 작성을 완료하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm1').submit();
		        }
		    });
		    return false;
		}
	</script>
</head>
<body>
	└
	<form id="frm1" action="${conPath }/fcomment/reply.do" onsubmit="return confirmSubmit();">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="commentPageNum" value="${param.commentPageNum}">
		<input type="hidden" name="fid" value="${fcomment.fid }">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="fcgroup" value="${fcomment.fcgroup}">
		<input type="hidden" name="fcstep" value="${fcomment.fcstep}">
		<input type="hidden" name="fcindent" value="${fcomment.fcindent}">
		<input type="hidden" name="fcip" value="${fcomment.fcip}">
		<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:50px; float:left; margin: 5px;" required="required"></textarea>
		<input type="submit" value="대댓글 작성" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
</body>
</html>