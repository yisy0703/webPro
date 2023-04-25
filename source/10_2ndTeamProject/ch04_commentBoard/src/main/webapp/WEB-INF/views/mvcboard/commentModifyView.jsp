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
</head>
<body>
	<br>
	<div>
		<c:forEach var="i" begin="1" end="${comment.cindent }">
			<c:if test="${i==comment.cindent }">
				&nbsp; &nbsp; &nbsp; └
			</c:if>
			<c:if test="${i!=comment.cindent }">
				&nbsp; &nbsp; &nbsp; 
			</c:if>
		</c:forEach>
		${comment.cnum }.
		<input type="hidden" name="cnum" value="${comment.cnum }">
		<input type="text" name="cmemo" value="${comment.cmemo }" size="3">
		<i>from ${comment.cip } - at ${comment.cdate }</i>
		<span id="${comment.cnum }" class="modifyView btn" id="${comment.cnum }">[ 수정 ]</span>
		<span onclick="location='${conPath}/comment/delete.do?cnum=${comment.cnum }&bid=${param.bid }&pageNum=${param.pageNum }&comPageNum=${comPaging.currentPage }'" class="btn">[ 삭제 ]</span>
		<span id="${comment.cnum }" class="replyView" class="btn">[ 답변 ]</span>
	</div>
	<br>
</body>
</html>