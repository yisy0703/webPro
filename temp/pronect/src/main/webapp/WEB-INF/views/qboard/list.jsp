<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
	<style>
		#content{width:700px;	margin:0 auto;}
	</style>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<style>
		#content {width: 800px; height:1200px;margin: 50px auto; }
		img{width: 100px;}
		a {text-decoration: none; color:black;}
		b {color:red;}
 		.back{width : 30px; text-align: left;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('tr:not(:first-child)').click(function(){
				var qid = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
				if(!isNaN(qid)){
					location.href = '${conPath}/qboard/content.do?qid='+qid+'&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';					
				}
			});
		});
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${writeResult eq SUCCESS }">
		<script>alert('글 작성을 완료했습니다');</script>
	</c:if>
	<c:if test="${writeResult eq FAIL }">
		<script>alert('글 작성에 실패했습니다');</script>
	</c:if>
	<c:if test="${deleteResult eq SUCCESS }">
		<script>alert('${param.qid}번 글을 삭제하였습니다');</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>alert('${param.qid}번 글 삭제에 실패했습니다');</script>
	</c:if>
	<c:if test="${replyResult eq SUCCESS }">
		<script>alert('답글을 작성하셨습니다');</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>alert('답변 작성에 실패했습니다');</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
		<div>
			<form action="${conPath }/qboard/list.do">
				<select name="schItem">
					<option value=""
						<c:if test="${param.schItem eq '' }">selected="selected"</c:if>
					>검색조건</option>
					<option value="qtitle" 
						<c:if test="${param.schItem eq 'qtitle' }">selected="selected"</c:if>
					>제목</option>
					<option value="qcontent" 
						<c:if test="${param.schItem eq 'qcontent' }">selected="selected"</c:if>
					>내용</option>
					<option value="all" 
						<c:if test="${param.schItem eq 'all' }">selected="selected"</c:if>
					>제목+내용</option>
				</select>
				<input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색">
			</form>
			<button type="button" onclick="location.href='${conPath}/qboard/write.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">글쓰기</button>
		</div>
		<table>
			<caption>문의게시판</caption>
			<tr>
				<th>글번호</th><th>글쓴이</th><th>제목</th><th>작성일</th>
			</tr>
			<c:if test="${empty qboardList }">
				<tr><th style="text-align:center;" colspan="4">검색하신 조건의 글이 없습니다.</th></tr>
			</c:if>
			<c:forEach var="qboard" items="${qboardList }">
				<tr>					
					<td>${qboard.qid }</td>
					<td>${qboard.mid }</td>
					<td class="left">
						<c:forEach var="i" begin="1" end="${qboard.qindent }">
						 	<c:if test="${i == qboard.qindent }">
						 		└─re:
						 	</c:if>
						 	<c:if test="${i != qboard.qindent }">
						 		&nbsp; &nbsp; &nbsp; 
						 	</c:if>
						</c:forEach>
						${qboard.qtitle }
						<c:if test="${not empty qboard.qfile }">
							<img src="https://cdn-icons-png.flaticon.com/512/5088/5088374.png" style="width:15px;">
						</c:if>
					</td>
					<td><fmt:formatDate value="${qboard.qrdate }" type="date" dateStyle="short"/></td>
				</tr>
			</c:forEach>
		</table><br>
		<div>
			<c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/qboard/list.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/qboard/list.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/qboard/list.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>