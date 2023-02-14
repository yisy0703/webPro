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
			height:600px; line-height: 600px; font-size: 32px;
			text-align: center;
			width:400px;            	
			margin:0px auto; 
		}
	</style>
</head>
<body>
	<jsp:include page="../member/header.jsp"/>
	<div id="mainForm_wrap">
		CONTENT
	</div>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>













