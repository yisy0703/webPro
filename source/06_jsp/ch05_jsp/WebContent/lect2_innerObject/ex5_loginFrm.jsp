<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/ex5.css" rel="stylesheet">
</head>
<body>
	<form action="ex5_loginCertification.jsp" method="post">
		<table>
			<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw"></td></tr>
			<tr><td colspan="2"><input type="submit" value="로그인"></td></tr>
		</table>
	</form>
	<div id="msg">
		<%
			String msg = request.getParameter("msg");
			if(msg!=null){
				out.print(msg);
			}
		%>
	</div>
</body>
</html>













