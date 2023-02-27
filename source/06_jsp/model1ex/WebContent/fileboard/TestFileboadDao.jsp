<%@page import="com.lec.dao.FileboardDao"%>
<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>1. 글목록</h1>
	<%
		FileboardDao fDao = FileboardDao.getInstance();
		ArrayList<FileboardDto> dtos = fDao.listBoard(2, 10);
		for(FileboardDto dto : dtos){
			out.println(dto + "<br>");
		}
	%>
	<h1>2. 글갯수 : <%=fDao.getFileboardCnt() %></h1>
	<%
		FileboardDto dto = new FileboardDto("aaa","제목",null, null, "1", 0, 0, 0, "129.9.9.1");
		int result = fDao.insertBoard(dto);
	%>
	<h1>3. 5번글 답변글쓰기 </h1>
	<%
		dto = new FileboardDto("ddd","답",null, null, "1", 5, 0, 0, "127.0.0.1");
		result = fDao.reply(dto);
	%>
	<h1>4. 8번글 조회수 올리고 상세보기 </h1>
	<%
		fDao.hitUp(8);
		dto = fDao.getBoard(8);
		out.println("8번 글(수정전) : " + dto);
	%>
	<h1>5. 8번글 수정하기 </h1>
	<%
		dto.setFcontent("바뀐 본문내용");
		result = fDao.updateBoard(dto);
		out.println(result == FileboardDao.SUCCESS? "수정성공":"수정실패");
		dto = fDao.getBoard(8);
		out.println("<br>수정후 바뀐 8번글 내용 : " + dto);
	%>
	<h1>6. 8번글 삭제하기 </h1>
	<%
		result = fDao.deleteBoard(8, "1");
	out.println(result == FileboardDao.SUCCESS? "6번글 삭제성공":"6번글 삭제실패");
	%>
</body>
</html>