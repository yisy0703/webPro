<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
	#content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	        title: '정말로 회원 탈퇴하시겠습니까?',
	        text: '떠나지 마세요...',
	        showCancelButton: true,
	        confirmButtonText: '완료',
	        cancelButtonText: '취소',
	        icon: 'warning',
	    }).then((result) => {
	        if (result.isConfirmed) {
	            document.getElementById('frm').submit();
	        }
	    });
	    return false;
	}
</script>
<script>
	$(document).ready(function(){
		$('form').submit(function(){
			var oldMpw = $('input[name="oldMpw"]').val();
			if(oldMpw != '${member.mpw}'){
  				alert('비밀번호가 틀립니다');
  				$('input[name="oldMpw"]').focus();
  				return false; // submit 제한
  			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member/deactivate.do" method="post" id="frm" onsubmit="return confirmSubmit();">
		<input type="hidden" name="mid" value="${member.mid }">
		<table>
			<caption>회원탈퇴</caption>
			<tr><td>비밀번호</td><td><input type="password" name="oldMpw"></td></tr>
			<tr>
				<td colspan="2">
					정말로 회원탈퇴 하시겠습니까?
					<input type="submit" value="회원탈퇴">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
