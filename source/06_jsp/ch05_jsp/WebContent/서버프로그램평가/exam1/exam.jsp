<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#wrap {width:300px; margin: 30px auto;}
		button {width:95px; padding:20px; border:1px solid #1a1a8e; outline:none; 
			background-color: #cfd3ee;
		}
		h2{text-align: center; color:red;}
	</style>
	<script>
		function position(n){
			location.href = 'examPro.jsp?su='+n;
		}
	</script>
</head>
<body>
	<div id="wrap">
		<button onclick="position(1)">1번</button>
		<button onclick="position(2)">2번</button>
		<button onclick="position(3)">3번</button>
		<br>
		<%
		String msg = request.getParameter("msg");
		if(msg!=null){
			out.println(msg);
		}
		%>
	</div>
</body>
</html>