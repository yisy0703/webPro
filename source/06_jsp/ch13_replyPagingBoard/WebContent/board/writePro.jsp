<%@page import="com.lec.dao.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
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
	<%
		// num, ref, re_step, re_indent ( 0이던지, 원글의 정보이던지 )
		// writer, subject, content, email, pw ( 원글이던지 답변글이던지 )
		request.setCharacterEncoding("utf-8"); 
		/* pageNum */
		String pageNum = request.getParameter("pageNum");
	%>
	<jsp:useBean id="dto" class="com.lec.dto.BoardDto" scope="page"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		dto.setIp(request.getRemoteAddr()); // 클라이언트가 요청한 컴퓨터 ip
		//dto.setRdate(new Timestamp(System.currentTimeMillis())); // 요청이 들어온 시점
		BoardDao bDao = BoardDao.getInstance();
		int result;
		int num = dto.getNum();
		if(num==0){ // 원글쓰기
			result = bDao.insertBoard(dto);
		}else{ // 답변글쓰기
			result = bDao.reply(dto);
		}
		if(result == BoardDao.SUCCESS){
	%>		
			<script>
				alert('<%=num==0? "글쓰기 완료" : "답변글 쓰기 완료"%>');
				location.href = '<%=conPath%>/board/list.jsp?pageNum=<%=pageNum%>';
			</script>
	<%}else{%>
			<script>
				alert('<%=num==0? "글쓰기" : "답변글 쓰기"%> 실패(길어)');
				history.back();
			</script>
	<%}%>	
</body>
</html>













