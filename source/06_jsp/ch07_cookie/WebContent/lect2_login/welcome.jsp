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
		String id=null, name=null; // 쿠키가 있을 경우 쿠키값을 저장할 용도
		Cookie[] cs = request.getCookies();
		if(cs!=null){
			for(Cookie c : cs){
				if(c.getName().equals("id")){
					id = c.getValue();
				}else if(c.getName().equals("name")){
					name = c.getValue();
				}
			} // for - 로그인 했다면 id("aaa"), name("홍길동") / 로그인 전이면 id(null), name(null)
		}
		if(id==null){ // 로그인 전
	%>
			<h1>손님(guest) 어서오세요. 로그인하세요</h1>
			<p>
				<button onclick="location.href='login.html'">로그인</button>
				<button onclick="location.href='cookieList.jsp'">쿠키들 확인</button>
			</p>
	<%}else{ // 로그인 후 %>
			<h1><%=name %>(<%=id %>)님 반갑습니다</h1>
			<p>
				<button onclick="location.href='logout.jsp'">로그아웃</button>
				<button onclick="location.href='cookieList.jsp'">쿠키들 확인</button>
			</p>
	<%}%>
</body>
</html>




























