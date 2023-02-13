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
	<h1>쿠키 리스트</h1>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int idx=0 ; idx<cookies.length ; idx++){
				String name = cookies[idx].getName(); // idx번째 쿠키의 이름
				String value = cookies[idx].getValue(); // idx번째 쿠키 값
				out.println("<h2>" + idx +"번째 쿠키 이름:" + name + ", 값:" + value+"</h2>");
			}
		}else{
			out.println("<h2>해당서버로 부터 생성된 쿠키가 없습니다</h2>");
		}
	%>
	<hr>
	<a href="ex1_cookieConstruct.jsp">쿠키 생성</a><br>
	<a href="ex2_cookieList.jsp">쿠키 리스트</a><br>
	<a href="ex3_thatCookie.jsp">특정 쿠키(쿠키 이름이 cookieName) 찾기</a><br>
	<a href="ex4_cookieDelete.jsp">특정 쿠키 지우기</a><br>
</body>
</html>





