<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<br>
	<div>
		<form action="${conPath}/comment/modify.do">
			<input type="hidden" name="cnum" value="${comment.cnum }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="comPageNum" value="${param.comPageNum}">
			<input type="hidden" name="bid" value="${comment.bid}">
			<c:forEach var="i" begin="1" end="${comment.cindent }">
				<c:if test="${i==comment.cindent }">
					&nbsp; &nbsp; &nbsp; └
				</c:if>
				<c:if test="${i!=comment.cindent }">
					&nbsp; &nbsp; &nbsp; 
				</c:if>
			</c:forEach>
			<span style="display:block; height:30px; float:left; margin: 5px;">${comment.cnum }.</span>
			
			<input type="text" name="cname" value="${comment.cname }" style="width:100px; height:30px; float:left; margin: 5px;" placeholder="글쓴이">
			<textarea rows="2" cols="5" name="cmemo" style="width:50%; height:30px; float:left; margin: 5px;">${comment.cmemo }</textarea>
			<input type="submit" value="수정" class="btn" style="height:30px; float:left; margin: 5px;">
		</form>
	</div>
	<p style="clear:both;"></p>
	<br>
</body>
</html>