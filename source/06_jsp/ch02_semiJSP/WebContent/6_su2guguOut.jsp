<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
	%>
	<h2><%=su1%>단부터 <%=su2 %>단까지 구구단 출력</h2>
	<%for(int j=su1 ; j<=su2 ; j++){ %>
				<%=j %>단 
	<%} %>
	<%for(int i=1 ; i<=9 ; i++){ %>
			<p>
			<%for(int j=su1 ; j<=su2 ; j++){ %>
				<%=j + " * " + i + " = " + (j*i) %> &nbsp;    
			<%} %>
			</p>
	<%} %>
</body>
</html>




