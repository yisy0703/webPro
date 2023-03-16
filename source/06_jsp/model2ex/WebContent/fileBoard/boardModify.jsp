<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<style>
		#content_form {
			height:400px;
			margin: 100px auto 0px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<form action="${conPath }/boradModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="fid" value="${board.fid }">
		<input type="hidden" name="dbFileName" value="${board.ffileName }">
		<table>
			<caption>${board.fid }번 글 수정</caption>
			<tr><th>작성자</th>
					<td><input type="text" required="required"
								value="${board.mname }(${board.mid })" readonly="readonly"></td>
			</tr>
			<tr><th>제목</th>
					<td><input type="text" name="ftitle" required="required"
								value="${board.ftitle }"></td>
			</tr>
			<tr><th>본문</th>
					<td><textarea rows="5" 
							name="fcontent">${board.fcontent }</textarea></td>
			</tr>
			<tr><th>첨부파일</th>
					<td><input type="file" name="ffileName" class="btn"> 원첨부파일:
							<c:if test="${not empty board.ffileName }">
						 		<a href="${conPath }/fileBoardUp/${board.ffileName}" target="_blank">${board.ffileName}</a>
						 	</c:if>
						 	<c:if test="${empty board.ffileName }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><td colspan="2">
						<input type="submit" value="수정" class="btn">
						<input type="reset" value="이전" class="btn"
						  onclick="history.back()">
						<input type="button" value="목록"  class="btn"
							onclick="location='${conPath}/boardList.do?pageNum=${param.pageNum }'">
					</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>