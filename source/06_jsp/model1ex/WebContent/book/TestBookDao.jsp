<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dto.BookDto"%>
<%@page import="com.lec.dao.BookDao"%>
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
		BookDao bDao = BookDao.getInstance();
		BookDto book = new BookDto(0, "Spring", 30000, "noImg.png","nothing.png", null, 10, null);
	%>
	<h1>1. 책등록</h1>
	<%
		int result = bDao.insertBook(book);
		if(result == BookDao.SUCCESS){
			out.println("책등록 성공<br>");
		}else{
			out.println("책등록 실패 :" + book+"<br>");
		}
	%>
	<h1>2. 책목록</h1>
	<%
		ArrayList<BookDto> books = bDao.listBook(4, 6);
		for(int i=0 ; i<books.size() ; i++){
			out.println(books.get(i) + "<br>");
		}
	%>
	<h1>3. 등록된 책 갯수 : <%=bDao.getBookTotCnt() %></h1>
	<h1>4. 1번책 상세보기 : <%=bDao.getBook(1) %></h1>
</body>
</html>