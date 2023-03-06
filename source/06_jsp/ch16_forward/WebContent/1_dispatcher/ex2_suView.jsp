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
	<h2>1부터 ${param.su }까지의 누적합은 ${sum }입니다</h2>
	<button onclick="history.back()">이전</button>
	<button onclick="location.href='ex2_suInput.jsp'">다시1(X)</button>
	<button onclick="location.href='1_dispatcher/ex2_suInput.jsp'">다시2</button>
	<button onclick="location.href='<%=conPath %>/1_dispatcher/ex2_suInput.jsp'">다시3</button>
</body>
</html>











