<%@page import="com.lec.dto.FriendDto"%>
<%@page import="com.lec.dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<style>
	
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<%
		FriendDao dao = new FriendDao();
		for(int i=0 ; i<20 ; i++ ){
			FriendDto friend = null;
			if(i%3 == 0){
				friend = new FriendDto(0, "홍길동", "010-9999-9999", "서울시 서대문구");
			}else if(i%3 == 1){
				friend = new FriendDto(0, "박순동", "010-8888-8888", "인천시 계양구");
			}else{
				friend = new FriendDto(0, "김갈동", "010-7777-7777", "경기도 안양시");
			}
			dao.insertFriend(friend);
		}
		response.sendRedirect("friendLidt.do");
	%>
</body>
</html>