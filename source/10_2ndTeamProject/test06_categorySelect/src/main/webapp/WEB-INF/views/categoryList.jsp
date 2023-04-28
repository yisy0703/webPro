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
		.selected {border: 1px solid red;}
		.unselected {}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.selected ').click(function(){
				alert($(this).text()+'를 카테고리 선택을 해제해요');
				location.href = 'deleteClike.do?sub='+$(this).text();
			});
			$('.unselected ').click(function(){
				alert($(this).text()+'를 카테고리 선택해요');
				location.href = 'insertClike.do?sub='+$(this).text();
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty msg }">alert('${msg }');</c:if>
	카테고리 리스트들 : ${catgoryList }<br>
	나의 선택된 리스트 : ${mylist }
	<h2>빨간색은 선택된 카테고리</h2>
	<c:set var="mainTemp" value=""/>
	<c:forEach items="${catgoryList }" var="category">
		<!--  cno를 "1, " 같은 스트링 형식으로 -->
		<c:if test="${mainTemp !=category.main   }">
			<h1>${category.main }</h1>
		</c:if>
		<button
			<c:if test="${mylist.indexOf(category.cno) != -1}"> class="selected" </c:if>
		 	<c:if test="${mylist.indexOf(category.cno) eq -1}"> class="unselected"</c:if>
		>${category.sub }</button>
		<c:set var="mainTemp" value="${category.main }"/>	
	</c:forEach>
</body>
</html>