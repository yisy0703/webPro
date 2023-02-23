<%@page import="com.lec.dao.BoardDao"%>
<%@page import="com.lec.dto.BoardDto"%>
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
		/* pageNum 추가 */
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) 
			pageNum="1";
		int num=0, ref=0, re_step=0, re_indent=0;
		BoardDto dto = new BoardDto(); // 답변글을 위해 들어왔다면 dto에 원글에 대한 정보를 저장할 예정
		if(request.getParameter("num")!=null){
			// 답변글을 쓰려고 온 경우  dto에 원글의 정보 넣는다
			num = Integer.parseInt(request.getParameter("num"));
			BoardDao bDao = BoardDao.getInstance();
			dto = bDao.getBoardOneLine(num); // 원글의 정보
			ref     = dto.getRef();    // 원글의 ref
			re_step = dto.getRe_step();// 원글의 re_step
			re_indent=dto.getRe_indent();// 원글의 re_indent
			System.out.println("writeFrom(답변글쓰기)에서 넘어온 원글의 ref : " + ref);
			System.out.println("writeFrom(답변글쓰기)에서 넘어온 원글의 re_step : " + re_step);
			System.out.println("writeFrom(답변글쓰기)에서 넘어온 원글의 re_indent : " + re_indent);
		}
	%>
	<form action="<%=conPath %>/board/writePro.jsp" method="post">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="ref" value="<%=ref %>">
		<input type="hidden" name="re_step" value="<%=re_step %>">
		<input type="hidden" name="re_indent" value="<%=re_indent %>">
		<table>
			<caption><%=num==0? "":num+"번 글의 답변 " %>게시판</caption>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" required="required" 
									autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="subject" required="required" value="<%
										if(dto.getSubject()!=null) 
											out.print("답 : " + dto.getSubject());
				%>"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td>
					<textarea rows="5" cols="10" name="content" 
										required="required"></textarea>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="<%=num==0? "글쓰기":"답글쓰기" %>" class="btn">
					<input type="reset" value="취소" class="btn">
					<input type="button" value="목록" class="btn"
						onclick="location.href='<%=conPath%>/board/list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>	
	</form>	
</body>
</html>




