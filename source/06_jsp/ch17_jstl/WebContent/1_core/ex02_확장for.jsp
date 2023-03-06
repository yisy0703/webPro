<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String[] names = {"홍길동","김길동","신길동"};
		/* for(String name : names){
			out.println("<p>" + name + "</p>");
		}
		for(int idx=0 ; idx<names.length ; idx++){
			out.println("<p>" + idx + "번째 : " + names[idx] +"</p>");
		} */
	%>
	<c:set var="names" value="<%=names %>"/> <!-- names라는 변수 선언 -->
	<c:forEach var="name" items="${names }">
		<p>${name }</p>
	</c:forEach>
	<c:forEach var="name" items="${names }" begin="0" end="1">
		<p>${name }</p>
	</c:forEach>
	<hr>
	<c:set var="idx" value="0"/> <!-- idx라는 변수를 0으로 선언 -->
	<c:forEach var="name" items="${names }">
		<p>${idx }번째 ${name }</p>
		<c:set var="idx" value="${idx+1 }"/> <!-- idx를 재선언 -->
	</c:forEach>
	<p>최종 idx값은 ${idx }입니다</p>
</body>
</html>











