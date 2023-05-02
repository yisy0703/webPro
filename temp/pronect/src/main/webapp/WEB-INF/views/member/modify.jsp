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
	#content {width: 800px; height:800px;margin: 50px auto;}
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
	$(document).ready(function(){
		$('form').submit(function(){
			var mmail = $('input[name="mmail"]');
			var patternMmail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
			var oldMpw = $('input[name="oldMpw"]').val();
			if(!mmail.val().match(patternMmail)){
				alert('메일 형식이 맞지 않습니다');
				mmail.focus();
				return false;
			}else if(oldMpw != '${member.mpw}'){
  				alert('현재 비밀번호를 확인하세요');
  				$('input[name="oldMpw"]').focus();
  				return false; // submit 제한
  			}
		});
	});
</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/member/login.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member/modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${member.mid }">
		<input type="hidden" name="mnickname" value="${member.mnickname }">
		<table>
			<tr><td>아이디</td><td>${member.mid }</td></tr>
			<tr><td>닉네임</td><td>${member.mnickname }</td></tr>
			<tr><td>현재 비밀번호</td><td><input type="password" name="oldMpw"></td></tr>
			<tr><td>새 비밀번호</td><td><input type="password" name="mpw"></td></tr>
			<tr><td>이름</td><td><input type="text" name="mname" value="${member.mname }"></td></tr>
			<tr><td>이메일</td><td><input type="text" name="mmail" value="${member.mmail }"></td></tr>
			<tr><td>직업군</td><td><input type="text" name="mrole" value="${member.mrole }"></td></tr>
			<tr><td>사진</td><td><input type="file" name="tempMimage">현재 첨부파일 : 
				<c:if test="${not empty member.mimage }">
			 		<a href="${conPath }/memberFile/${member.mimage}">${member.mimage}</a>
			 	</c:if>
			 	<c:if test="${empty member.mimage }">
			 		첨부파일없음
			 	</c:if>
			</td></tr>
			<tr><td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="이전" onclick="history.back()">
				<button type="button" onclick="location.href='${conPath}/member/deactivate.do'" >회원탈퇴</button>
			</td></tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>