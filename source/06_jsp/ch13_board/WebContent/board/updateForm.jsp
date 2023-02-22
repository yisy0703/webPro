<%@page import="com.lec.dto.BoardDto"%>
<%@page import="com.lec.dao.BoardDao"%>
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
		String num = request.getParameter("num");
		BoardDao bDao = BoardDao.getInstance();
		BoardDto dto = bDao.getBoardOneLine(num);
	%>
	<form action="<%=conPath%>/board/updatePro.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
		<table>
			<caption><%=num %>번 글 수정</caption>
			<tr>
				<th>작성</th>
				<td>
					<input type="text" name="writer" readonly="readonly" value="<%=dto.getWriter()%>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>















