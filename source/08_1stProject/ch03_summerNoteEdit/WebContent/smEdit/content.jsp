<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.btn').click(function(){
				var cno = $(this).attr('id');
				$.ajax({
					url : '${conPath}/commentsModifyView.do',
					type : 'post',
					data : 'cno='+cno,
					dataType : 'html',
					success : function(data){
						$('#ccontent'+cno).html(data);
					}
				});
			});
		});
	</script>
</head>
<body>
<!-- 
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${replyModifyResult eq SUCCESS}">
		<script>
			alert('댓글 수정 성공');
		</script>
	</c:if>
	<c:if test="${replyModifyResult eq FAIL}">
		<script>
			alert('댓글 수정 실패');
		</script>
	</c:if>
	
	<c:if test="${replyWriteResult eq SUCCESS}">
		<script>
			alert('댓글 쓰기 성공');
		</script>
	</c:if>
	<c:if test="${replyWriteResult eq FAIL}">
		<script>
			alert('댓글 쓰기 실패');
		</script>
	</c:if>
	 -->
	<table>
		<caption>${dto.bno } 글 자세히 보기</caption>
		<tr><th>글 제목</th>
				<td>${dto.btitle }</td>
		</tr>
		<tr><th>글 본문</th>
				<td>${dto.bcontent}</td>
		</tr>
		<tr><th>첨부파일</th>
				<td>
					<c:if test="${empty dto.bfile }">첨부파일없음</c:if>
					<c:if test="${not empty dto.bfile }">
						<a href="img/${dto.bfile }" target="_blank">${dto.bfile }</a>
					</c:if>
				</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="history.back()">이전</button>
				<button onclick="location.href='${conPath }/smEditModifyView.do?bno=${dto.bno }'">수정</button>
				<button onclick="location='${conPath }/smEditList.do'">목록</button>
			</td>
		</tr>
	</table>
	<h2>댓글 : ${dto.cnt }개</h2>
	<form action="${conPath }/comments.do">
		<input type="hidden" name="bno" value="${dto.bno }">
		<textarea name="rcontent" rows="2" cols="20"></textarea>
		<input type="submit" value="댓글">
	</form>
	<c:forEach var="comment" items="${comments }">
		<p id="ccontent${comment.cno }">${comment.ccontent }   <button id="${comment.cno }" class="btn">수정</button><p>
	</c:forEach>
</body>
</html>