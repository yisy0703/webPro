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
	<h1>특정 쿠키(쿠키이름이 cookieName인 쿠키)의 값 확인</h1>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			int idx;
			for(idx = 0 ; idx<cookies.length ; idx++){
				String name = cookies[idx].getName(); // idx번째 쿠키 이름
				if(name.equals("cookieName")){
					String value = cookies[idx].getValue(); // 쿠키값
					out.println("<h3>찾고자 하는 쿠키이름:" + name +", 값:"+value+"</h3>");
					break;
				}//if
			}//for
			if(idx==cookies.length){
				out.println("<h3>찾고자 하는 쿠키가 없습니다</h3>");
			}
		}else{
			out.println("<h3>생성된 쿠키가 없습니다</h3>");
		}
	%>
	<hr>
	<a href="ex1_cookieConstruct.jsp">쿠키 생성</a><br>
	<a href="ex2_cookieList.jsp">쿠키 리스트</a><br>
	<a href="ex3_thatCookie.jsp">특정 쿠키(쿠키 이름이 cookieName) 찾기</a><br>
	<a href="ex4_cookieDelete.jsp">특정 쿠키 지우기</a><br>
</body>
</html>













