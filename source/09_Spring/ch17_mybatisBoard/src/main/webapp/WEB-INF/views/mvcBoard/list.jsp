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
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			/* $('tr').click(function(){
				var bid = $(this).children().eq(2).text();
				if(!isNaN(bid)){
					location.href = '${conPath }/mvcBoard/content.do?bid='+bid+'&pageNum=${paging.currentPage}';
				}
			}); */ 
		});
		const trClicked = function(bid){
			location.href = '${conPath}/mvcBoard/content.do?bid=' + bid
												+ '&pageNum=${paging.currentPage}';
		};
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${writeResult eq SUCCESS}">
		<script>alert('글쓰기 성공');</script>
	</c:if>
	<c:if test="${writeResult eq FAIL}">
		<script>alert('글쓰기 실패');</script>
	</c:if>
	
	<c:if test="${modifyResult eq SUCCESS }">
		<script>alert('${param.bid}번 글 수정 성공');</script>
	</c:if>
	<c:if test="${modifyResult eq FAIL }">
		<script>
			alert('${param.bid}번 글 수정 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${deleteResult eq SUCCESS }">
		<script>alert('${param.bid}번 글 삭제완료');</script>
	</c:if>
	<c:if test="${replyResult eq SUCCESS }">
		<script>alert('${param.bid}번 글에 대한 답글쓰기 성공');</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>
			alert('${param.bid}번 글에 대한 답글쓰기 실패');
			history.back();
		</script>
	</c:if>
	
	<c:set var="oNum" value="${startRow }"/>
	<c:set var="iNum" value="${paging.totCnt - paging.startRow + 1 }"/>
	
	<table>
		<caption>게시판</caption>
		<tr><td><a href="${conPath }/mvcBoard/write.do">글쓰기</a></td></tr>
	</table>
	
	<table>
		<tr>
			<th>순번</th><th>역순</th>
			<th>글번호</th><th>글쓴이</th><th>글제목</th>
			<th>작성일</th><th>조회수</th>
		</tr>
		<c:if test="${totCnt eq 0}">
			<tr><td colspan="7">해당 페이지의 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${totCnt != 0 }">
			<c:set var="oNum" value="${paging.startRow }"/>
			<c:set var="iNum" value="${paging.totCnt - paging.startRow + 1 }"/>
			<c:forEach var="dto" items="${boardList }">
				<tr onclick="trClicked(${dto.bid})">
					<td>${oNum }</td>
					<td>${iNum }</td>
					<td>${dto.bid }</td>
					<td>${dto.bname }</td>
					<td class="left">
						<c:forEach var="i" begin="1" end="${dto.bindent }">
							<c:if test="${i != dto.bindent }">
								&nbsp; &nbsp; &nbsp;
							</c:if>
							<c:if test="${i eq dto.bindent }">
								└─
							</c:if>
						</c:forEach> <!-- 답글 들여쓰기 처리 -->
						${dto.btitle }
						<c:if test="${dto.bhit > 10 }">
							<b> * </b>
						</c:if>
					</td>
					<td>
						<fmt:formatDate value="${dto.bdate }" pattern="yy/MM/dd(E) HH:mm"/>
					</td>
					<td>${dto.bhit }</td>
				</tr>
				<c:set var="oNum" value="${oNum + 1 }"/>
				<c:set var="iNum" value="${iNum - 1 }"/>
			</c:forEach>
		</c:if>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/mvcBoard/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				[ <b>${i }</b> ]
			</c:if>
			<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/mvcBoard/list.do?pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/mvcBoard/list.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>















