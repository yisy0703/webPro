<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body { background-color: #ffffaa; }
	footer {height:80px;background-color: #003300;}
	footer #footer_conts, footer #footer_conts a {
		color:white;
		font-weight: blod;
		font-size:0.9em;
		text-align: center;
	}
	footer #footer_conts p:first-child {
		font-weight: bold; height: 30px; line-height: 30px;
	}
</style>
</head>
<body>
	<footer>
		<div id="footer_conts">
			<p>(주)좋은시스템 402</p> 
			<p>서울특별시 어떤구 어떤로 9 좋은빌딩 1-5F | <b><a href="${conPath }/adminLoginView.do">관리자 모드</a></b></p>
			<p>Copyright© 2022 tj . All rights reserved.</p>
		</div>
	</footer>
</body>
</html>