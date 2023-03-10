<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		h1, p{text-align: center;}
		p{margin-top: 30px;}
	</style>
</head>
<body>
	<form action="${conPath }/join.do" method="post" enctype="multipart/form-data">
		<table>
			<caption>회원가입</caption>
			<tr><th>아이디</th><td><input type="text" name="mid" required="required"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="mpw" required="required"></td></tr>
			<tr><th>이름</th><td><input type="text" name="mname" required="required"></td></tr>
			<tr><th>메일</th><td><input type="email" name="memail"></td></tr>
			<tr><th>사진</th><td><input type="file" name="mphoto"></td></tr>
			<tr><th>생년월일</th><td><input type="date" name="mbirth"></td></tr>
			<tr><th>주소</th><td><input type="text" name="maddress"></td></tr>
			<tr>
				<td colspan="2">
					<p>
						<input type="submit" value="회원가입">
						<input type="button" value="로그인" onclick="location='${conPath}/loginView.do'">
					</p>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>