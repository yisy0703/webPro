<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
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
		FileboardDao fDao = FileboardDao.getInstance();
		FileboardDto fbDto = new FileboardDto();
		for(int i=0 ; i<=70 ; i++){
			// 글 등록
			if(i%3==0){
				fbDto.setCid("aaa");
			}else if(i%3==1){
				fbDto.setCid("bbb");
			}else{
				fbDto.setCid("ccc");
			}
			fbDto.setFsubject("for문으로 강제로 입력한 제목 "+i);
			fbDto.setFcontent("본문");
			if(i%5==0){
				fbDto.setFfilename("1.docx");
			}else{
				fbDto.setFfilename(null);
			}
			fbDto.setFpw("1");
			fbDto.setFip("192.1.1."+i);
			System.out.println(fDao.insertBoard(fbDto)==1 ? i+"번째 성공":i+"번째 실패");
		}
		response.sendRedirect("fboardList.jsp");
	%>
</body>
</html>













