<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동전이 있는 곳을 맞춰봐</title>
	<style>
		#wrap {width:300px; margin: 30px auto; }
		#wrap h2 {text-align: center;}
		#wrap h2:first-child {color:red;}
		button {width:150px; padding:10px; border:1px solid #1a1a8e; outline:none;
			margin:10px auto;  display:block; 
			background-color: #cfd3ee;
		}
	</style>
</head>
<body>
	<%!String suParam; int su; %>
	<%
		suParam = request.getParameter("su");
		if(suParam!=null){
			su = Integer.parseInt(suParam);
			int computerSu = (int)(Math.random()*3)+1;
			/* Random random = new Random();
			computerSu = random.nextInt(3)+1; */
			if(su!=computerSu){
				String msg = "<h2>Wrong! Try Again!</h2>"+
										"<h2>("+su+"은(는) 아니고 정답은 "+computerSu+")</h2>";
				msg = URLEncoder.encode(msg,"utf-8");
				response.sendRedirect("exam.jsp?msg="+msg);
			}	
		}else{
			response.sendRedirect("exam.jsp");
		}
	%>
	<div id="wrap">
		<h2>정답입니다</h2>
		<h2>동전이 있던 곳은 <%=su %></h2>
		<button onclick="location.href='exam.jsp'">다시 도전</button>
	</div>
</body>
</html>