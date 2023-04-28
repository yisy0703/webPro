<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		button{margin: 10px;}
		.liked {border: 1px solid red; background-color: pink;}
		.unliked {}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.liked').click(function(){
				location.href = 'deleteLike?sub='+$(this).text();
			});
			$('.unliked').click(function(){
				location.href = 'insertLike?sub='+$(this).text();
			});
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${empty member }">
		<script>location.href='${conPath}/login?after=categoryList';</script>
	</c:if>
	<c:if test="${not empty msg }">
		<script>swal('info','${msg}','success');</script>
	</c:if>
	<c:if test="${not empty msg }">alert('${msg }');</c:if>
	카테고리 리스트들 : ${catgoryList }<br>
	나의 선택된 리스트 : ${mylist }
	<h2>핑크색은 관심목록 카테고리</h2>
	<c:set var="mainTemp" value=""/>
	<c:forEach items="${catgoryList }" var="category">
		<!--  cno를 "1, " 같은 스트링 형식으로 -->
		<c:if test="${mainTemp !=category.main   }">
			<h1>${category.main }</h1>
		</c:if>
		<button
			<c:if test="${mylist.indexOf(category.cno) != -1}"> class="liked" </c:if>
		 	<c:if test="${mylist.indexOf(category.cno) eq -1}"> class="unliked"</c:if>
		>${category.sub }</button>
		<c:set var="mainTemp" value="${category.main }"/>	
	</c:forEach>
	<h2 onclick="location.href='${conPath}/loginOut'" style="cursor: pointer;">로그아웃</h2>
</body>
</html>