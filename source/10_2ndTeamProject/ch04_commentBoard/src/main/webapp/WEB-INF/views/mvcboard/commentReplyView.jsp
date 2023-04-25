<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<form action="${conPath }/comment/reply.do">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="comPageNum" value="${param.comPageNum}">
		<input type="text" name="bid" value="${comment.bid}">
		<input type="text" name="cgroup" value="${comment.cgroup}">
		<input type="text" name="cstep" value="${comment.cstep}">
		<input type="text" name="cindent" value="${comment.cindent}">
		<input type="text" name="cname" value="" style="width:100px; height:50px; float:left; margin: 5px;" placeholder="글쓴이">
		<textarea rows="2" cols="5" name="cmemo" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
		<input type="submit" value="댓글저장" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
</body>
</html>