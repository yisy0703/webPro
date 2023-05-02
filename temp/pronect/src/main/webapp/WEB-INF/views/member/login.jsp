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
<link href="${conPath }/css/joinAndLogin.css" rel="stylesheet">
<style>
	#content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
	function alert(msg) {
		Swal.fire(msg);
	}
</script>
</head>
<body>
	<c:if test="${joinResult eq 1 }">
		<script>alert('${mDto} 회원가입 감사합니다');</script>
	</c:if>
	<c:if test="${not empty loginResult}">
		<script>alert('${loginResult}');</script>
	</c:if>
	<c:if test="${not empty searchIdResult}">
		<script>alert('${searchIdResult}');</script>
	</c:if>
	<c:if test="${not empty searchPwResult}">
		<script>alert('${searchPwResult}');</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			location.href='${conPath}/main/main.do';
		</script>
</c:if>
	<jsp:include page="../main/header.jsp"/>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		window.Kakao.init("f9874e5b00c71f621fc4c80e11e94244");
		
		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope:'profile_nickname, account_email, gender',
				success: function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					});
				}
			});
		}
	</script>
	<div id="joinAndLoginWrap">
		<div id="div_joinAndLogin">
		<form action="${conPath }/member/login.do" method="post">
			<table>
				<caption>로그인</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" required="required" value="${mid }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mpw" required="required" value="${mpw }"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인" class="btn">
						<a href="javascript:kakaoLogin();"><img alt="카카오로 로그인" src="${conPath }/images/kakao_login_large_narrow.png"></a>
					</td>
				</tr>
			</table>
		</form>
		<a href="${conPath}/member/searchId.do">아이디 찾기</a> &nbsp; / &nbsp; <a href="${conPath}/member/searchPw.do">비밀번호 찾기</a>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
