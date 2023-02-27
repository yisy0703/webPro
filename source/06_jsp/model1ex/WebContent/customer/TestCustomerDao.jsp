<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="com.lec.dao.CustomerDao"%>
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
	<h1>1. cid 중복체크 : hhh</h1>
	<%
		String cid = "hhh";
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.confirmCid(cid);
		if(result == CustomerDao.CUSTOMER_EXISTENT){
			out.println(cid + "는 중복된 아이디여서 회원가입불가");
		}else{
			out.println(cid + "는 가입가능한 아이디여서 가입합니다 : ");
			CustomerDto customer = new CustomerDto(cid, "1", "김", null, null, null, null, null, null);
			result = cDao.insertCustomer(customer);
			out.println(result == CustomerDao.SUCCESS? "회원가입성공":"회원가입실패");
		}
	%>
	<h1>2. 로그인 체크</h1>
	<%
		result = cDao.loginCheck("hhh", "1");
		out.println(result == CustomerDao.LOGIN_SUCCESS? "로그인 성공":"로그인 실패");
		out.println("<br> hhh-2 :");
		result = cDao.loginCheck("hhh", "2");
		out.println(result == CustomerDao.LOGIN_SUCCESS? "로그인 성공":"로그인 실패");
	%>
	<h1>3. dto 가져오기</h1>
	<%
		CustomerDto customer = cDao.getCustomer(cid);
		out.println(customer);
	%>
	<h1>4. 회원정보 수정하기</h1>
	<%
		customer.setCtel("010-9999-9999");
		customer.setCemail("test@test.com");
		customer.setCaddress("서울");
		result = cDao.updateCustomer(customer);
		out.println(result == CustomerDao.SUCCESS? "수정 성공":"수정 실패");
		customer = cDao.getCustomer(cid);
		out.println("<br>수정후 : "+customer);
	%>
	<h1>5. 회원목록</h1>
	<%
		ArrayList<CustomerDto> customers = cDao.listCustomer(1, 5);
		for(int i=0 ; i<customers.size() ; i++){
			out.println(i + "번째 : " + customers.get(i) + "<br>");
		}
	%>
	<h1>3. 등록된 회원수 : <%=cDao.getCustomerCnt() %></h1>
</body>
</html>