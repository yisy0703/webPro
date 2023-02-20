<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String conPath = request.getContextPath(); 
	if(session.getAttribute("customer")!=null){
		response.sendRedirect(conPath+"/customer/main.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../customer/header.jsp"/>
	<div id="loginForm_wrap">
		<div id="login_title">로그인</div>
		<form action="<%=conPath%>/customer/loginPro.jsp" method="post">
			<input type="hidden" name="method" value="<%=request.getParameter("method")%>">
			<table>
				<tr><td></td></tr>
				<tr>
					<td><label for="cid">아이디</label></td>
					<td><input type="text" name="cid" id="cid" required="required"
									autofocus="autofocus"
									value="<%
										String cid = (String)session.getAttribute("cid");
										if(cid!=null){
											out.print(cid);
										}
									%>"></td>
				</tr>
				<tr>
					<td><label for="cpw">비밀번호</label></td>
					<td><input type="password" name="cpw" id="cpw" required="required"></td>
				</tr>
				<tr><td></td></tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인"  class="loginBtn_style">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<%
							String msg = request.getParameter("msg");
							if(msg!=null){ // 로그인 실패해서 다시 옴
						%>
							<p id="login_findIdPw" onclick="alert('아이디는 aaa/비번은 111')">
								아이디/비밀번호를 잊으셨나요?
							</p>
						<%}%>
					</td>
				</tr>
			</table>
			<p id="login_join">
				아직 회원이 아니신가요? 
				<a href="<%=conPath%>/customer/join.jsp">회원가입</a>
			</p>
		</form>
	</div>
	<jsp:include page="../customer/footer.jsp"/>
</body>
</html>