<%@page import="com.lec.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/content.css" rel="stylesheet" type="text/css">
	<style>
		#content_form{padding: 40px;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<%
		if(session.getAttribute("customer")==null){
			response.sendRedirect(conPath+"/customer/loginForm.jsp?method=book/bookRegister");
		}
	%>
	 <form action="bookRegisterPro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption>책 등 록</caption>
			<tr>
				<th>책제목</th>
				<td>
					<input type="text" name="btitle" maxlength="33" required="required"
																																	 autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="number" name="bprice" min="0" max="999999" required="required">
				</td>
			</tr>
			<tr>
				<th>대표이미지</th>
				<td><input type="file" name="bimage1"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><input type="file" name="bimage2"></td>
			</tr>
			<tr>
				<th>책소개</th>
				<td><textarea rows="5" name="bcontent"></textarea></td>
			</tr>
			<tr>
				<th>할인율</th>
				<td>
					<input type="number" name="bdiscount" min="0" max="100" value="0" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="책등록" class="btn"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>











