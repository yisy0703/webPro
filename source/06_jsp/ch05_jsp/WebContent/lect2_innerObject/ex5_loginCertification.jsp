<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/ex5.css" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id==null || !id.equals("aaa") || pw==null || !pw.equals("111")){
			String msg = "Check the ID & PW";
			response.sendRedirect("ex5_loginFrm.jsp?msg="+msg);
		}/* else{
			out.println("<h2>ID는 "+id +"이고<br> 비밀번호는 " + pw +"입니다<br><br>");
			out.println("반갑습니다</h2>");
		} */
	%>
	<h2>
		ID는 "+id +"이고<br> 비밀번호는 " + pw +"입니다<br><br>
		반갑습니다.
	</h2>
</body>
</html>











