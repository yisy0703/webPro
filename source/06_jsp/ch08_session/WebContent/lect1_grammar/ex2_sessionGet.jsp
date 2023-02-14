<%@page import="com.lec.ex.Member"%>
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
	<%
		// 특정한 세션값 가져오기(세션의 특정한 속성값 가져오기)
		String sessionName = (String)session.getAttribute("sessionName");
	  Integer sessionNum = (Integer)session.getAttribute("sessionNum");
		Member member = (Member)session.getAttribute("member");
		String noSessionName = (String)session.getAttribute("noSessionName");
		out.println("<h2>sessionName : " + sessionName + "</h2>");
		out.println("<h2>sessionNum : " + sessionNum + "</h2>");
		out.println("<h2>member : " + member + "</h2>");
		if(member!=null){
			out.println("<h2>member안의 id : " + member.getId() + "</h2>");
			out.println("<h2>member안의 pw : " + member.getPw() + "</h2>");
			out.println("<h2>member안의 name : " + member.getName() + "</h2>");
		}
		out.println("<h2>세션에 추가하지 않은 데이터 : " + noSessionName + "</h2>");
	%>
	<hr>
	<h2>세션 ID : <%=session.getId() %></h2>
	<h2>세션의 유효시간 : <%=session.getMaxInactiveInterval() %></h2>
	<hr>
	<a href="ex1_sessionAddAttr.jsp">세션 데이터 추가</a><br>
	<a href="ex2_sessionGet.jsp">특정 세션 GET</a><br><br>
	<a href="ex3_sessionList.jsp">세션 모든 데이터 리스트</a><br>
	<a href="ex4_sessionRemove.jsp">세션 삭제(특정 세션이나 모든 세션 데이터)</a>
</body>
</html>















