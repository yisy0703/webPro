<%@page import="com.lec.customer.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body{background-color: lightyellow;}
		header {width: 800px; margin: 0 auto;}
		header ul {overflow: hidden;}
		header ul li{
			list-style: none;
			float: right; 
			padding: 10px 30px;
		}
		header ul li a{
			text-decoration: none;
			font-weight: bold; font-size: 1.5em;
			color:#005500;
		}
	</style>
</head>
<body>
	<header>
		<div id="nav">
		<% CustomerDto cutomer = (CustomerDto)session.getAttribute("customer"); %>
		<%if(cutomer==null){  // 로그인 전 해더화면 %>
				<ul>
					<li><a href="<%=conPath %>/customer/join.jsp">회원가입</a></li>
					<li><a href="<%=conPath%>/customer/login.jsp">로그인</a></li>
					<li><a href="<%=conPath%>/customer/main.jsp">홈</a></li>
				</ul>
		<%}else{ // 로그인 후 해더화면%>
				<ul>
					<li><a href="<%=conPath%>/customer/logout.jsp">로그아웃</a></li>
					<li><a href="<%=conPath %>/customer/modify.jsp">정보수정</a></li>
					<li><a href="<%=conPath%>/customer/main.jsp"><%=cutomer.getCname() %>님</a></li>
				</ul>
		<%}%>		
		</div>
	</header>
</body>
</html>













