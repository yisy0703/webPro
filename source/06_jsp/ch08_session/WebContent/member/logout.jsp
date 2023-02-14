<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		// id쿠키와 name쿠키 삭제하고 main.jsp로 이동
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				String cname = cookie.getName();
				if(cname.equals("id")){
					// id라는 이름의 쿠키 삭제
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}else if(cname.equals("name")){
					// name이라는 이름의 쿠키 삭제
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}//if
			}//for
		}//if
		response.sendRedirect(conPath+"/member/main.jsp");
	%>
</body>
</html>















