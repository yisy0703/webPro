<%@page import="com.lec.ex.dto.Dto"%>
<%@page import="com.lec.ex.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Dao dao = new Dao();
	for(int i=0 ; i<50 ; i++){
		Dto dto = null;
		if(i%3==0){
			dto = new Dto(0, "유길동", "010-9999-9989","서울시 용산구");
		}else if(i%3==1){
			dto = new Dto(0, "박선동", "010-8888-9989","인천시 계양구");
		}else{
			dto = new Dto(0, "정소돈", "010-2222-2222","서울시 강남구");	
		}
		dao.insert(dto);
	}
	response.sendRedirect("list.do");
%>
	
</body>
</html>