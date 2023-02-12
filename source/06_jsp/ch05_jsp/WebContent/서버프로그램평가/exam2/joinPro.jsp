<%@page import="java.sql.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='join.css' rel='stylesheet'>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name       = request.getParameter("name");
	String id     		= request.getParameter("id");
	String pw 				= request.getParameter("pw");
	String birth 			= request.getParameter("birth");
	Timestamp birthTimestamp = Timestamp.valueOf(birth + " 00:00:00");
	String[] hobby 		= request.getParameterValues("hobby");
	String gender 		= request.getParameter("gender");
	String email 			= request.getParameter("email");
	String[] mailSend = request.getParameterValues("mailSend");
%>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입정보</div>
		<h2>name : <%=name %></h2>
		<h2>id : <%=id %></h2>
		<%-- <h2>pw : <%
					for(int i=0 ; i< pw.length() ; i++){
						out.print('*');
					}%></h2> --%>
		<h2>pw : <%=pw.replaceAll("[a-zA-Z0-9~`!@#$%^&*()\\-_+=|\\{}\\[\\]:;\"'?/<>,\\.]", "*") %></h2>
		<h2>birth : <%=birth %></h2>
		<h2>birth : <%=birthTimestamp %></h2>
		<h2>hobby : <% 
				if(hobby!=null) {
					for(int i=0 ; i<hobby.length ; i++)
						if(i==hobby.length-1)
							out.print(hobby[i]);
						else
							out.print(hobby[i]+", ");
				}else {
					out.print("없음");
				}
		%></h2>
		<h2>gender : <%=gender %></h2>
		<h2>email : <%=email %></h2>
		<h2>mailSend : <%
				if(mailSend!=null){
					out.print(Arrays.toString(mailSend));
				}else{
					out.print("모두 수신 거부");
				}
		%></h2>
		<h2>가입일 : <%=new Date(System.currentTimeMillis()) %></h2>
		<h2>가입IP : <%=request.getRemoteAddr() %></h2>
	</div>
	<%@ include file="footer.jsp" %><!-- jsp 소스가 include -->
</body>
</html>