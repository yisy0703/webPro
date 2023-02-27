<%@page import="java.net.URLEncoder"%>
<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="com.lec.dao.CustomerDao"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%-- modifyOk.jsp에서 전달받은 파라미터 : 
		cid, cpw(바꾸싶은새비번), cname, ctel, cemail, caddress, cgender(CustomerDto)
		tempCbirth, oldCpw(현비번) (dto에 없는 파라미터변수)
	 --%>
	 <% request.setCharacterEncoding("utf-8"); %>
	 <jsp:useBean id="dto" class="com.lec.dto.CustomerDto" scope="page"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		String tempCbirth = request.getParameter("tempCbirth"); // ""이거나 "1995-12-12"
		if(!tempCbirth.equals("")){
			dto.setCbirth(Date.valueOf(tempCbirth));
			// dto의 birth가 Timestamp형이면 : dto.setBirth(Timestamp.valueOf(tempBirth+" 00:00:00"));
		}
		CustomerDto customer = (CustomerDto)session.getAttribute("customer");
		String sessionPw = null;
		if(customer!=null){
			sessionPw = customer.getCpw(); // 세션의 customer의 pw
		}
		String oldCpw = request.getParameter("oldCpw");
		if(sessionPw.equals(oldCpw)){
	 		// 현비밀번호를 맞게 입력한 경우 정보 수정 진행
	 		if(dto.getCpw()==null){
	 			// 새비밀번호를 현비밀번호로 
	 			dto.setCpw(oldCpw);
	 		}
			CustomerDao cDao = CustomerDao.getInstance();
			int result = cDao.updateCustomer(dto);
			if (result == CustomerDao.SUCCESS){
				session.setAttribute("customer", dto);
	%>
	 			<script>
	 				alert('정보수정이 완료되었습니다');
	 				location.href = '<%=conPath%>/main/main.jsp';
	 			</script>
	 <%}else{// 수정 실패 %>
	 		<script>
	 			alert('회원정보 수정이 실패되었습니다. 정보가 너무 깁니다');
	 			location.href = '<%=conPath%>/customer/modifyForm.jsp';
	 		</script>		 		
	 <%	} %>
 <%}else{// 현비밀번호를 틀리게 입력한 경우 정보수정했던 페이지로 넘김 %>	
	 		<script>
	 			alert('현 비밀번호가 바르지 않습니다. 확인하세요');
	 			history.back();
	 		</script>	
 <%}%>
</body>
</html>