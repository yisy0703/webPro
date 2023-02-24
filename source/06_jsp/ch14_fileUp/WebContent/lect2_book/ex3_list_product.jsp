<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.book.*"%>
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
	<table>
		<tr>
			<%
				BookDao bDao = BookDao.getInstance();
				ArrayList<BookDto> books = bDao.listBook();
				for(int i=0 ; i<books.size() ; i++){
					int bprice = books.get(i).getBprice();
					int bdiscount = books.get(i).getBdiscount();
					int discountPrice = bprice * (100-bdiscount) / 100;
					
			%>
					<td>
						<a href="detail.jsp?bid=<%=books.get(i).getBid()%>">
							<img src="<%=conPath%>/bookImg/<%=books.get(i).getBimage1()%>"><br>
							<%=books.get(i).getBid() %>. <%=books.get(i).getBtitle() %> <br>
						</a>
						<del><%=bprice %></del><br>
						<b><%=discountPrice %>원 (<%=bdiscount %> % 할인)</b>
					</td>
					<%if(i%3 == 2) out.println("</tr><tr>"); %>
			<%}%>
		</tr>
	</table>
</body>
</html>
















