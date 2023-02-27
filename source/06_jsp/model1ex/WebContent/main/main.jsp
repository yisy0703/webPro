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
	%>
	<table>
		<tr style="height:60px;">
			<th>회원ID</th><th>비밀번호</th><th>이름</th><th>메일</th><th>주소</th>
		</tr>
		<%
			if(customers.size()==0){
				out.println("<tr><td colspan='5'>해당 회원이 없습니다</td></tr>");
			}else{ 
				for(int i=0 ; i<customers.size() ; i++){
					String cemail = customers.get(i).getCemail();
					String caddress = customers.get(i).getCaddress();
					out.println("<tr>");
					out.println("<td>" + customers.get(i).getCid() + "</td>");
					out.println("<td>" + customers.get(i).getCpw() + "</td>");
					out.println("<td>" + customers.get(i).getCname() + "</td>");
					out.println("<td>" + (cemail==null? "-":cemail) + "</td>");
					out.println("<td>" + (caddress==null? "-":caddress) + "</td>");
					out.println("</tr>");
				}
			}
		%>
	</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>	
</body>
</html>
















