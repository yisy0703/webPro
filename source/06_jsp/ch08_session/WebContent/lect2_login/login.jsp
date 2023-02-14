<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String conPath = request.getContextPath(); 
	// 로그인 후에는 로그인 페이지를 요청할 경우 welcome.jsp로 
	if(session.getAttribute("name")!=null){
		response.sendRedirect("welcome.jsp");
	}
	// 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="<%=conPath %>/lect2_login/loginOk.jsp" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" required="required" autofocus="autofocus"
									value="<% 
										String sessionId = (String)session.getAttribute("id");
										if(sessionId != null){
											out.print(sessionId);
										}
									%>"
						>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn">
					<input type="button" value="회원가입" class="btn"
						onclick="location.href='<%=conPath%>/lect2_join/join.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
















