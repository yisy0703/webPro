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
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- reply_view.jsp : param.pageNum, param.bid, requestScope.replyBoard(원글정보)  -->
	<form action="${conPath }/reply.do" method="post">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bid" value="${param.bid }"> <!-- 원글 -->
		<input type="hidden" name="bgroup" value="${replyBoard.bgroup }"><!-- 원글 -->
		<input type="hidden" name="bstep" value="${replyBoard.bstep }"><!-- 원글 -->
		<input type="hidden" name="bindent" value="${replyBoard.bindent }"><!-- 원글 -->
		<table>
			<caption>${param.bid }번의 답변글쓰기</caption>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="bname" required="required"
							autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<th>글제목</th>
				<td>
					<input type="text" name="btitle" required="required"
											value="[답]${replyBoard.btitle.substring(0,1) }"	>
				</td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="20" name="bcontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답글쓰기" class="btn">
					<input type="reset" value="취소" class="btn">
					<input type="button" value="목록" class="btn"
						onclick="location.href='${conPath}/list.do?pageNum=${param.pageNum }'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>














