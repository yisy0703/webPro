<%@page import="com.lec.book.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.book.BookDao"%>
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
		BookDao dao = BookDao.getInstance();
		ArrayList<BookDto> books = dao.listBook();
	%>
	<table>
		<caption>책 리스트</caption>
		<tr><th>책ID</th><th>책이름</th><th>책표지</th><th>가격</th><th>할인율</th></tr>
		<%if(books.size() == 0 ){
				out.println("<tr><td colspan='5'>등록된 책이 없습니다</td></tr>");
			}else{
				for(BookDto book : books){
					int price = book.getBprice();
					int bdiscount = book.getBdiscount();
					int discountPrice = price * (100-bdiscount) / 100 ;
					out.println("<tr>");
					out.println("<td>" + book.getBid() + "</td>");
					out.println("<td><a href='detail.jsp?bid="+book.getBid()+"'>" 
																								+ book.getBtitle() + "</a></td>");
					out.println("<td>");
					out.println("		<a href='detail.jsp?bid="+book.getBid()+"'>");
					out.println("		<img src='" + conPath + "/bookImg/" + book.getBimage1() 
														+ "' width='15'>");
					out.println("		</a>");
					out.println("</td>");
					out.println("<td><del>"+price+"</del> <b>"+discountPrice + "원</b></td>");
					out.println("<td>" + bdiscount +"%</td>");
					out.println("</tr>");
				}
			}			
		%>
	</table>
</body>
</html>















