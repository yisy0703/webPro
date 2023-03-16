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
	<c:if test="${empty member }"> <!-- 로그인 후에만 해당 답글을 달 수 있음 -->
		<script>
			location.href='${conPath}/loginView.do?next=boardReplyView.do?fid=${param.fid }&pageNum=${param.pageNum }';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<form action="${conPath }/boardReply.do" method="post" enctype="multipart/form-data">
			<!-- reply.do시 필요한 원글 정보 : bGroup, bStep, bIndent
			                              지금 입력할 답변글 : bName, bTitle, bContent
			                       pageNum -->
			<input type="hidden" name="fgroup" value="${originBoard.fgroup }">
			<input type="hidden" name="fstep" value="${originBoard.fstep }">
			<input type="hidden" name="findent" value="${originBoard.findent }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<caption>${originBoard.fid }번글의 답변쓰기 폼</caption>
				<tr><td>작성자</td><td>${member.mname }(${member.mid })</td></tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="ftitle" required="required"
								value="[답]${originBoard.ftitle }">
					</td>
				</tr>
				<tr><td>본문</td><td><textarea name="fContent" rows="3" cols="3"></textarea></td></tr>
				<tr><td>첨부파일</td><td><input type="file" name="ffilName"></td></tr>
				<tr><td colspan="2">
							<input type="submit" value="답변쓰기" class="btn">
							<input type="reset" value="취소" class="btn">
							<input type="button" value="목록" class="btn"
								onclick="location.href='${conPath}/boardList.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>