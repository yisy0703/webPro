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
	<style>
		
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('tr').click(function(){
				let bno = Number($(this).children().eq(0).text());
				if(!isNaN(bno)){
					location.href='${conPath}/detailBboard.do?bno='+bno+'&pageNum=${paging.currentPage}&schItem=${param.schItem}&schWord=${param.schWord}';
				}
			});
		});
		/* const trClicked = function(bno){
			location.href='${conPath}/detail.do?bno='+bno+'&pageNum=${paging.currentPage}&schItem=${param.schItem}&schWord=${param.schWord}';
		} */
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${not empty successMsg }">
		<script>
			swal('성공', '${successMsg}', 'success'); // 'success', 'error','warning', 'info', 'question'
		</script>
	</c:if>
	<c:if test="${not empty failMsg }">
		<script>
			swal('실패', '${failMsg}', 'error');
		</script>
	</c:if>
	<div align="center">
		<form action="${conPath }/listBboard.do">
			<select name="schItem">
				<option value="">검색조건</option>
				<option value="btitle"
					<c:if test="${param.schItem=='btitle' }">selected="selected"</c:if>
				>제목</option>
				<option value="bcontent"
					<c:if test="${param.schItem=='bcontent' }">selected="selected"</c:if>
				>내용</option>
				<option value="btitleBcontent"
					<c:if test="${param.schItem=='btitleBcontent' }">selected="selected"</c:if>
				>제목+내용</option>
			</select>
			<input type="text" name="schWord" class="btn" value="${param.schWord }">
			<input type="submit" value="검색" class="btn">
		</form>
	</div>
	<table>
		<tr><td colspan="2"><a href="${conPath }/writeBboard.do">글쓰기</a></td></tr>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
		</tr>
		<c:if test="${list.size() eq 0 }">
			<tr><td colspan="2">해당 데이터가 없습니다</td></tr>
		</c:if>
		<c:forEach var="dto" items="${list }">
			<tr onclick="trClicked(${dto.bno})">
				<td>${dto.bno }</td>
				<td>${dto.btitle } 
						<c:if test="${dto.bfile!=null and dto.bfile!='' }">
							<!-- 첨부파일이 있으면 파일이미지 나타남 -->
							<img src="${conPath }/img/file.gif">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div class="paging">
		<c:if test="${paging.startPage>paging.blockSize}">
			<a href="${conPath }/listBboard.do?pageNum=${paging.startPage-1}&schItem=${param.schItem }&schWord=${param.schWord}">&nbsp;〈〈&nbsp;</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage==i }">
				<b>&nbsp;${i }&nbsp;</b>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<a href="${conPath }/listBboard.do?pageNum=${i }&schItem=${param.schItem }&schWord=${param.schWord}">&nbsp;${i }&nbsp;</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
			<a href="${conPath }/listBboard.do?pageNum=${paging.endPage + 1}&schItem=${param.schItem }&schWord=${param.schWord}">&nbsp;〉〉&nbsp;</a>
		</c:if>
	</div>
</body>
</html>