<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String conPath = request.getContextPath();
	if(session.getAttribute("member")!=null){ // 로그인 상태
		response.sendRedirect("main.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="joinOk.jsp" method="post">
		<table>
			<caption>회원가입</caption>
			<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pwChk"></td></tr>
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr>
				<th>전화번호</th>
				<td>
					<select name="phone1">
						<option></option>
						<option>010</option>
						<option>02</option>
						<option>031</option>
						<option>032</option>
					</select> -
					<input type="text" name="phone2" size="2"> -
					<input type="text" name="phone3" size="2">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
















