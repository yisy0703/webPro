<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% // http://localhost:8090/ch02_semiJSP/5_gugudanSuOut.jsp?su=4
		int su = Integer.parseInt("");
	%>
	<h2><%=su %>단 구구단</h2>
	<%for(int i=1 ; i<10 ; i++){ %>
		<%-- <p><%=su %> * <%=i %> = <%=su*i %> </p> --%>
		<p><%=su + " * " + i + " = " + (su*i) %> </p>
	<%} %>
</body>
</html>















