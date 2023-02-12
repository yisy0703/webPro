<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/ex2.css" rel="stylesheet">
</head>
<body>
	<form action="ex2_memoPro.jsp" method="post">
		<table>
			<tr><th>작성자</th><th>한줄 메모</th></tr>
			<tr>
				<td><input type="text" name="writer" size="3"></td>
				<td><input type="text" name="memo" size="30"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="메모작성"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>








