<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#logoutForm_wrap{
			height:600px; line-height: 600px; font-size: 32px;
			text-align: center;
			width:800px;            	
			margin:0px auto; 
		}
	</style>
	<script>
		setTimeout(function(){location.href='main.jsp';}, 3000);
	</script>
</head>
<body>
	<%
		session.invalidate();
	%>
	<jsp:include page="header.jsp"/>
	<div id="logoutForm_wrap">
		로그아웃되었습니다. 잠시후 페이지 이동이 있겠습니다
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>















