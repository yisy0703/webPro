<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table { border-collapse: collapse; }
		td {padding:2px 7px; border-left: 1px solid blue;}
		td:last-child { border-right: 1px solid blue;}
	</style>
</head>
<body>
	<%
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
	%>
	<table>
		<caption><%=su1%>단부터 <%=su2 %>단까지 구구단 출력</caption>
		<tr>
		<%for(int j=su1 ; j<=su2 ; j++){ %>
			<th><%=j %>단</th>
		<%} %>
		</tr>
		<%for(int i=1 ; i<=9 ; i++){ %>
				<tr>
				<%for(int j=su1 ; j<=su2 ; j++){ %>
					<td><%=j + " * " + i + " = " + (j*i) %></td> 
				<%} %>
				</tr>
		<%} %>
	</table>
</body>
</html>