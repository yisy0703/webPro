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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
		function modifyComment(cnum, pageNum, bid, comPageNum){
			$.ajax({
				url : '${conPath}/comment/modifyView.do',
				data : {'cnum':cnum, 'pageNum':pageNum, 'comPageNum':comPageNum},
				type : 'get',
				dateType : 'html',
				success : function(data, status){
					$('.reply'+cnum).html(data);
				}
			});
		}
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${modifyResult eq SUCCESS }">
		<script>alert('수정 성공');</script>
	</c:if>
	<c:if test="${modifyResult eq 0 }">
		<script>alert('수정 실패'); history.back();</script>
	</c:if>
	<!-- ${bDto } ${param.bid } ${param.pageNum } 들어옴 -->
	<table>
		<caption>상세보기</caption>
		<tr><th>글번호</th><td>${bDto.bid}</td></tr>
		<tr><th>작성자</th><td>${bDto.bname}</td></tr>
		<tr><th>제목</th><td>${bDto.btitle}</td></tr>
		<tr><th>본문</th><td><pre>${bDto.bcontent }</pre></td></tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${bDto.bdate }" pattern="yy/MM/dd(E)"/>
		</td>
		<tr><th>IP</th><td>${bDto.bip }</td></tr>
		<tr><th>조회수</th><td>${bDto.bhit }</td></tr>
		<tr>
			<td colspan="2">
				<button onclick="location='${conPath}/mvcboard/modify.do?bid=${param.bid }&pageNum=${param.pageNum }'">수정</button>
				<button onclick="location='${conPath}/mvcboard/delete.do?bid=${param.bid }&pageNum=${param.pageNum }'">삭제</button>
				<button onclick="location='${conPath}/mvcboard/reply.do?bid=${param.bid }&pageNum=${param.pageNum }'">답변</button>
				<button onclick="location='${conPath}/mvcboard/list.do?pageNum=${param.pageNum }'">목록</button>
			</td>
		</tr>
	</table>
	<h4>${param.bid }번 글의 댓글들</h4>
	<form action="${conPath }/comment/write.do">
		<input type="hidden" name="bid" value="${param.bid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="text" name="cname" value="" style="width:30%" placeholder="글쓴이">
		<textarea rows="2" cols="5" name="cmemo"></textarea>
		<input type="submit" value="댓글저장" class="btn">
	</form>
	<c:if test="${empty commentList }">등록된 댓글이 없습니다</c:if>
	<c:if test="${not empty commentList }">
		<c:forEach items="${commentList }" var="comment">
			<div class="reply${comment.cnum }">
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
					<span style="font-weight: blod; font-size: 1.3em;">${comment.cmemo }</span> 
					<i>from ${comment.cip } - at ${comment.cdate }</i>
					<span class="btn" onclick="modifyComment(${comment.cnum}, ${param.pageNum}, ${bDto.bid}, ${comPaging.currentPage})">[ 수정 ]</span>
					<span onclick="location='${conPath}/comment/delete.do?cnum=${comment.cnum }&bid=${param.bid }&pageNum=${param.pageNum }&comPageNum=${comPaging.currentPage }'" class="btn">[ 삭제 ]</span>
					<span id="${comment.cnum }" class="replyView" class="btn">[ 답변 ]</span>
				</div>
			</div>
			<br>
		</c:forEach>
	</c:if>
	<div class="paging">
		<c:if test="${comPaging.startPage > comPaging.blockSize }">
			[ <a href="${conPath }/mvcboard/content.do?bid=${param.bid}&pageNum=${param.pageNum }&comPageNum=${comPaging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${comPaging.startPage }" end="${comPaging.endPage }">
			<c:if test="${i eq comPaging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != comPaging.currentPage }">
				[ <a href="${conPath }/mvcboard/content.do?bid=${param.bid}&pageNum=${param.pageNum }&comPageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/mvcboard/content.do?bid=${param.bid}&pageNum=${param.pageNum }&comPageNum=${comPaging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>
















