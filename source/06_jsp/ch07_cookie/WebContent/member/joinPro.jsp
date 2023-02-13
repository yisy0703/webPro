<%@page import="java.sql.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<%=conPath %>/css/join.css' rel='stylesheet'>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name       = request.getParameter("name");
	String id     		= request.getParameter("id");
	String pw 				= request.getParameter("pw");
	String birth 			= request.getParameter("birth");
	//Date   birthDate  = Date.valueOf(birth);
	//Timestamp birthTimestamp = Timestamp.valueOf(birth + " 00:00:00");
	Date birthDate = null;
	Timestamp birthTimestamp = null;
	if(birth!=null && !birth.equals("")){
		birthDate = Date.valueOf(birth);
		birthTimestamp = Timestamp.valueOf(birth + " 00:00:00");
	}
	String[] hobby 		= request.getParameterValues("hobby");
	String gender 		= request.getParameter("gender");
	String email 			= request.getParameter("email");
	String[] mailSend = request.getParameterValues("mailSend");
%>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입정보</div>
		<h2>name : <%=name %></h2>
		<h3>id : <%=id %></h3>
		<%-- <h3>pw : <%
					for(int i=0 ; i< pw.length() ; i++){
						out.print('*');
					}%></h3> --%>
		<h3>pw : <%=pw.replaceAll("[a-zA-Z0-9~`!@#$%^&*()\\-_+=|\\{}\\[\\]:;\"'?/<>,\\.]", "*") %></h3>
		<%-- <h3>birth : <%=birth %></h3> --%>
		<h3>birth : <%=birthTimestamp!=null ? birthTimestamp : "" %></h3>
		<h3>hobby : <% 
				if(hobby!=null) {
					for(int i=0 ; i<hobby.length ; i++)
						if(i==hobby.length-1)
							out.print(hobby[i]);
						else
							out.print(hobby[i]+", ");
				}else {
					out.print("없음");
				}
		%></h3>
		<h3>gender : <%=gender %></h3>
		<h3>email : <%=email %></h3>
		<h3>mailSend : <%
				if(mailSend!=null){
					out.print(Arrays.toString(mailSend));
				}else{
					out.print("모두 수신 거부");
				}
		%></h3>
		<h3>가입일 : <%=new Date(System.currentTimeMillis()) %></h3>
		<h3>가입IP : <%=request.getRemoteAddr() %></h3>
		<input type="button" value="로그인" class="joinBtn_style" 
											onclick="location.href='<%=conPath%>/member/login.jsp'">
	</div>
	<%-- <%@ include file="footer.jsp" %><!-- jsp 소스가 include --> --%>
	<jsp:include page="../member/footer.jsp"/>
</body>
</html>






