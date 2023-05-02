<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Pronect</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${conPath }/css/main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
		function logout(){
		    Swal.fire({
		        title: "로그아웃 하시겠습니까?",
		        icon: "question",
		        showCancelButton: true,
		        confirmButtonText: "로그아웃",
		        cancelButtonText: "취소"
		    }).then((result) => {
		        if (result.isConfirmed) {
		            Swal.fire({
		                title: "로그아웃되었습니다.",
		                text: "다음에 다시 만나요~",
		                icon: "success",
		                confirmButtonText: "확인"
		            }).then(() => {
		                location.href = "${conPath}/member/logout.do";
		            });
		        }
		    });
		    return false;
		}
	</script>
</head>
<body class="is-preload">
	<header id="header">
		<div class="logo">	
			<a href="${conPath }/main.do">
				<img src="${conPath }/images/pronect_logo.png" alt="로고" />
			</a>
		</div>
		<nav>
			<c:if test="${empty member}">
				<ul>
					<li><a href="${conPath }/member/join.do">회원가입</a></li>
					<li><a href="${conPath }/member/login.do">로그인</a></li>
					<li><a href="#menu">메뉴</a></li>
				</ul>
			</c:if>
			<c:if test="${not empty member}">
				<ul>
					<li><a href="${conPath }/group/register.do">스터디/프로젝트  등록</a></li>
					<li><a href="${conPath }/member/logout.do"  onclick="return logout()">로그아웃</a></li>
					<li><a href="${conPath}/member/mypage.do">${member.mnickname }님</a></li>
					<li><a href="#menu">메뉴</a></li>
				</ul>
			</c:if>
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<h2>Menu</h2>
		<ul>
			<li><a href="${conPath}/main.do">Home</a></li>
			<li><a href="../group/myStudy.jsp">MyStudy</a></li>
			<li><a href="../group/myProject.jsp">MyProject</a></li>
			<li><a href="${conPath }/fboard/list.do?pageNum=1">자유게시판</a></li>
			<li><a href="${conPath }/qboard/list.do?pageNum=1">문의게시판</a></li>
			<c:if test="${member.manager eq 'Y' }">
				<li><a href="${conPath }/member/list.do?pageNum=1">회원목록(관리자 전용)</a></li>
			</c:if>
		</ul>
	</nav>
	<script src="${conPath }/js/util.js"></script>
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/browser.min.js"></script>
	<script src="${conPath }/js/breakpoints.min.js"></script>
	<script src="${conPath }/js/main.js"></script>	
</body>
</html>