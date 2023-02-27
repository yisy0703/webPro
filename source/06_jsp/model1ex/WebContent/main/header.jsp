<%@page import="com.lec.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/* CustomerDto c = new CustomerDto("a","1","홍길동", 
											null, null, null, null, null, null);
	session.setAttribute("customer", c); */
	String conPath = request.getContextPath();
	CustomerDto customer = (CustomerDto)session.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<div class="gnb">
			<%if(customer==null) { // 로그인 전 메뉴 (고객센터, 회원가입, 로그인) %>
				<ul>
					<li><a href="<%=conPath%>/fileboard/fboardList.jsp">고객센터</a></li>
					<li><a href="<%=conPath%>/customer/joinForm.jsp">회원가입</a></li>
					<li><a href="<%=conPath%>/customer/loginForm.jsp">로그인</a>
				</ul>
			<%}else{ // 로그인 후 메뉴(고객센터, 로그아웃, 정보수정, 이름님) %>
				<ul>
					<li><a href="<%=conPath%>/fileboard/fboardList.jsp">고객센터</a></li>
					<li><a href="<%=conPath%>/customer/logout.jsp">로그아웃</a></li>
					<li><a href="<%=conPath%>/customer/modifyForm.jsp">정보수정</a></li>
					<li><a href="#"><%=customer.getCname() %>님</a>
				</ul>
			<%} %>
		</div>
		<div class="logo" onclick="location.href='<%=conPath%>/'">
			<img src="https://www.moel.go.kr/images/layout/logo.png">
		</div>
		<div class="lnb">
			<ul>
				<li><a href="<%=conPath%>/book/bookList.jsp">도서목록</a></li>
				<%if(customer!=null){ %>
					<li><a href="<%=conPath%>/book/bookRegister.jsp">도서등록</a></li>
				<%} %>
			</ul>
		</div>
	</header>
</body>
</html>














