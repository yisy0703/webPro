<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:forward page="home.do"/> --%>
	<jsp:forward page="mvcBoard/list.do"/>
	<%-- <%response.sendRedirect("mvcBoard/insert60.do"); %> --%> <!-- insert60.do를 forward하면 controller의 forward가 바뀜 -->
</body>
</html>