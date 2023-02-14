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
			border: 1px solid #D4A190;
			line-height: 600px;
			text-align: center;
			font-size: 3em; color: #A47160;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<jsp:include page="../member/header.jsp"/>
	<div id="mainForm_wrap">
		main 화면
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>













