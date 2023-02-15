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
	<jsp:useBean id="p" class="com.lec.ex.Person" scope="page"/>
	<jsp:setProperty name="p" property="name" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty name="p" property="age"
														value='<%=Integer.parseInt(request.getParameter("age"))%>'/>
	<jsp:setProperty name="p" property="gender" 
														value='<%=request.getParameter("gender").charAt(0) %>'/>
	<jsp:setProperty name="p"  property="address"
														value='<%=request.getParameter("address") %>'/>
	<h2>입력받은 개인정보(step3)</h2>
	<p>이름 <jsp:getProperty name="p" property="name"/></p>
	<p>나이 <jsp:getProperty name="p" property="age"/></p>
	<p>성별 <jsp:getProperty name="p" property="gender"/></p>
	<p>주소 <jsp:getProperty name="p" property="address"/></p>
</body>
</html>















