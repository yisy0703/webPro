<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- ex3_param.jsp?n=1 -->
	<h1>ex4.jsp파일입니다</h1>
	<h2>ex3의 request에서 넘어온 n : <%=request.getParameter("n") %></h2>
	<h2>ex3의 param태그에서 넘어온 id : <%=request.getParameter("id") %></h2>
	<h2>ex3의 param태그에서 넘어온 pw : <%=request.getParameter("pw") %></h2>
</body>
</html>

















