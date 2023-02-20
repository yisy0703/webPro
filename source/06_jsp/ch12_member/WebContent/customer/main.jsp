<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#mainForm_wrap{
			width:1000px; margin: 10px auto; height: 600px; 
			border: 1px solid #005500;
			line-height: 600px;
			text-align: center;
			font-size: 3em; color: #005500;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<jsp:include page="../customer/header.jsp"/>
	<div id="mainForm_wrap">
		main 화면
	</div>
	<jsp:include page="../customer/footer.jsp"/>
</body>
</html>













