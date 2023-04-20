<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* { padding: 0; 	margin: 0; }
body {background-color: #FFF0B5;	font-size: 9pt;}
header a {text-decoration: none;	font-weight: bold;}
header li {	list-style: none;}
header .gnb {width: 100%;	background-color: #003300;}
header .gnb ul {
	overflow: hidden;
	width: 700px;
	height: 30px;
	line-height: 30px;
	margin: 0 auto;
}
header .gnb ul li {float: right;	margin-right: 30px;}
header .gnb a {
	color: #FFF0B5;
	font-size: 0.9em;
	display: block;
	padding-left: 15px;
	padding-right: 15px;
}
header .logo {
	width: 120px;
	height: 20px;
	line-height: 20px;
	text-align: center;
	margin: 15px auto;
	border: 1px solid #003300;
	cursor: pointer;
}
header .lnb {	width: 100%;}
header .lnb ul {overflow: hidden; 	width: 300px;		margin: 0 auto;}
header .lnb ul li {
	float: left;
	padding: 5px 20px;
	line-height: 25px;
	border-top: 1px dashed #003300;
	border-bottom: 1px dashed #003300;
}
header .lnb a {
	height: 1.1em;
	color: #003300;
	font-size: 1.1em;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<header>
	<div class="gnb">
	<c:if test="${empty member}">
		<ul>
			<li><a href="${conPath }/member.do?method=join">회원가입</a></li>
			<li><a href="${conPath }/member.do?method=login">로그인</a></li>
		</ul>
	</c:if>
	<c:if test="${not empty member}">
		<ul>
			<li><a href="${conPath }/member.do?method=modify">정보수정</a></li>
			<li><a href="${conPath }/member.do?method=logout">로그아웃</a></li>
			<li><a>${member.mname }님</a></li>
		</ul>
	</c:if>
	</div>
	<div class="logo" onclick="location.href='${conPath}/main.do'">LOGO</div>
	<div class="lnb">
		<ul>
			<li><a href="${conPath}/main.do">홈</a></li>
			<li><a href="${conPath }/book/list.do?pageNum=1">도서보기</a></li>
			<li><a href="${conPath }/book/register.do">도서등록</a></li>
		</ul>
	</div>
</header>
</body>
</html>