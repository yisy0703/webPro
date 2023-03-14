<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>alert('${joinResult}');</script>
	</c:if>
	<div id="loginForm_wrap">
		<div id="login_title">로그인</div>
		<form action="${conPath }/login.do" method="post">
			<table>
				<tr><td> </td></tr>
				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id" 
						required="required" autofocus="autofocus"
						value="${id }"></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" name="pw" id="pw" required="required"></td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
				<tr><td colspan="2"><input type="submit" value="로그인" 
								class="loginBtn_style"></td></tr>
				<tr>
					<td colspan="2">
						<p id="login_findIdPw" onclick="alert('id=aaa / pw=111');">
						아이디/비밀번호를 잊으셨나요?</p>
					</td>
				</tr>
			</table>
			<p id="login_join">아직 회원이 아니신가요? <a href="${conPath}/joinView.do">회원가입</a></p>
		</form>
	</div>
</body>
</html>