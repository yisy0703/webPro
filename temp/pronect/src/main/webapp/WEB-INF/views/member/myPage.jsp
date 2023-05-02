<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PRONECT</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="${conPath }/css/mypage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:if test="${empty member}">
		<script>
			alert('로그인 후 이용 가능합니다.');
			location.href='${conPath}/member/login.do';
		</script>
	</c:if>
	<div id="div_mypage">
		<h2>마이페이지</h2>
		<div id="div_myinfo">
			<div class="member_info">
				<p id="member_photo"><img src="${conPath }/memberFile/${member.mimage}"></p>
				<p><b>${member.mnickname }</b> 님</p>
				<p id="modify_myinfo"> <a href="${conPath}/member/modify.do"> 내 정보 수정 > </a></p>
			</div>
			<div class="myinfo_lnb">
				<ul>
					<li><a href="${conPath }/group/history.do"><img src="${conPath }/images/history.png"><br>나의 히스토리</a></li>
					<li><a href="${conPath }/group/mystudy.do"><img src="${conPath }/images/mystudy.png"><br>마이스터디</a></li>
					<li><a href="${conPath }/group/myproject.do"><img src="${conPath }/images/myproject.png"><br>마이프로젝트</a></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>