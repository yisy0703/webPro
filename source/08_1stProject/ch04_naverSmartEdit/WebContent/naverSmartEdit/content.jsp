<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
	<style>
	</style>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.commentModifyBtn').click(function(){
				var cno = $(this).attr('id');
				$.ajax({
					url : '${conPath}/commentModifyView.do',
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
	
	<c:if test="${not empty result }">
		<script>swal('댓글','${result }','success');</script>
	</c:if>
	<table>
		<caption>${dto.bno } 글 자세히 보기</caption>
		<tr><th>글 제목</th>
				<td>${dto.btitle }</td>
		</tr>
		<tr><th>글 본문</th>
				<td>
					${dto.bcontent }
				</td>
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
				<button onclick="location='${conPath }/naverSmartEditModifyView.do?bno=${dto.bno }'">수정</button>
				<button onclick="location='${conPath }/naverSmartEditList.do'">목록</button>
			</td>
		</tr>
	</table>
	<div id="comments">
		<h4>댓글 : ${dto.cnt }개</h4>
		<form action="${conPath }/commentsWrite.do">
			<input type="hidden" name="bno" value="${dto.bno }">
			<textarea name="ccontent" rows="2" id="commentWrite"></textarea>
			<input type="submit" value="댓글">
		</form>
		<c:forEach var="comment" items="${comments }">
			<p id="ccontent${comment.cno }">
				${comment.ccontent }
				<button id="${comment.cno }" class="commentModifyBtn">댓글수정</button>
				<button onclick="location='${conPath}/commentDelete.do?cno=${comment.cno }&bno=${param.bno }'">댓글삭제</button>
			</p>
		</c:forEach>
	</div>
</body>
</html>