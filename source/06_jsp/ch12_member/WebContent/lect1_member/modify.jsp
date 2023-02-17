<%@page import="com.lec.member.MemberDto"%>
<%@page import="java.sql.Date"%>
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
	<%! 
		String id, name, phone1, phone2, phone3, gender, email, address; 
		Date birth; 
	%>
	<%
		MemberDto member = (MemberDto)session.getAttribute("member");
		if(member==null){
			response.sendRedirect("login.jsp?method=modify");
		}else{
			id = member.getId();
			name = member.getName();
			phone1 = member.getPhone1();
			phone2 = member.getPhone2();
			phone3 = member.getPhone3();
			gender = member.getGender();
			email  = member.getEmail();
			address= member.getAddress();
			birth  = member.getBirth();
		}
	%>
	<form action="modifyOk.jsp" method="post">
		<table>
			<caption>정보수정</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="<%=id %>" readonly="readonly"></td>
			</tr>
		</table>
	</form>
</body>
</html>














