<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/content.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<%
		// main.jsp 또는 main.jsp?pageNum=1
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=5, BLOCKSIZE=2;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow   = startRow + PAGESIZE - 1;
		CustomerDao cDao = CustomerDao.getInstance();
		ArrayList<CustomerDto> customers = cDao.listCustomer(startRow, endRow);
		out.println(customers);
	%>
	</div>
	<jsp:include page="../main/footer.jsp"/>	
</body>
</html>
















