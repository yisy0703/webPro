<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="agree.jsp" method="post">
		<table>
			<caption>회원가입</caption>
			<tr>
				<th>아이디</th><td><input type="text" name="id" 
									required="required" autofocus="autofocus"></td> 
			</tr>
			<tr>
				<th>비밀번호</th><td><input type="password" name="pw" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th><td><input type="password" name="pwChk"></td>
			</tr>
			<tr>
				<th>이름</th><td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="가입" class="btn">
					<input type="reset" value="취소" class="btn">
					<input type="button" value="로그인" class="btn"
						onclick="location.href='<%=conPath%>/lect2_login/login.jsp'">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>
















