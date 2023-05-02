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
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
	  		$('.replyView').click(function(){
	  			var fcid = $(this).attr('id');
	  			$.ajax({
	  				url : '${conPath}/fcomment/replyView.do',
						data : {'fcid':fcid, 'pageNum':${param.pageNum}, 'commentPageNum':${commentPaging.currentPage}},
						type : 'get',
						dateType : 'html',
						success : function(data, status){
							$('.replySpace'+fcid).html(data);
						}
	  			});
	  		});
	  		
	  		$('#deleteBtn').click(function(){
	  			Swal.fire({
			        title: '정말로 글을 삭제하시겠습니까?',
			        showDenyButton: true,
			        confirmButtonText: '삭제',
			        denyButtonText: '취소',
			        icon: 'warning',
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	location.href = '${conPath}/fboard/delete.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}';
			        }
			    });
			    return false;
	  		});
	  	});
	  	
		function modifyComment(fcid, pageNum, fid, commentPageNum){
			$.ajax({
				url : '${conPath}/fcomment/modifyView.do',
				data : {'fcid':fcid, 'pageNum':pageNum, 'commentPageNum':commentPageNum},
				type : 'get',
				dateType : 'html',
				success : function(data, status){
					$('.reply'+fcid).html(data);
				}
			});
		}
		
		function confirmSubmit(){
		    Swal.fire({
		        title: '댓글 작성을 완료하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '완료',
		        cancelButtonText: '취소',
		        icon: 'question',
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById('frm').submit();
		        }
		    });
		    return false;
		}
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${modifyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '글 수정을 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${modifyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '글 수정을 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentReplyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '대댓글 작성을 완료했습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentReplyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '대댓글 작성을 실패했습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentModifyResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '댓글 수정을 완료하였습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentModifyResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '댓글 수정을 실패하였습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentWriteResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '댓글 작성을 완료하였습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentWriteResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '댓글 작성을 실패하였습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<c:if test="${fcommentDeleteResult eq SUCCESS }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'success',
			  title: '댓글을 삭제하였습니다!',
			  showConfirmButton: false,
			  timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${fcommentDeleteResult eq FAIL }">
		<script>
			Swal.fire({
			  position: 'top-end',
			  icon: 'error',
			  title: '댓글 삭제를 실패하였습니다...',
			  showConfirmButton: false,
			  timer: 2000
			});
			history.back();
		</script>
	</c:if>
	<!-- ${bDto } ${param.fid } ${param.pageNum } 들어옴 -->
	<table>
		<caption>글 내용</caption>
		<tr><th>글번호</th><td>${fDto.fid}</td></tr>
		<tr><th>글쓴이</th><td>${fDto.mid}</td></tr>
		<tr><th>제목</th><td>${fDto.ftitle}</td></tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${fDto.frdate }" type="both" dateStyle="short"/></td>
		</tr>
		<tr><th>본문</th><td><pre>${fDto.fcontent }</pre></td></tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${not empty fDto.ffile }">
					<a href="${conPath }/fboardFile/${fDto.ffile}">${fDto.ffile}</a>
				</c:if>
				<c:if test="${empty fDto.ffile }">
					첨부파일없음
				</c:if>
			</td>
		</tr>
		<tr><th>IP</th><td>${fDto.fip }</td></tr>
		<tr><th>조회수</th><td>${fDto.fhit }</td></tr>
		<tr><th>좋아요</th><td>${fDto.flike }</td></tr>
		<tr>
			<td colspan="2">
				<c:if test="${member.mid eq fDto.mid}">
					<button onclick="location='${conPath}/fboard/modify.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">수정</button>
				</c:if>
				<c:if test="${member.mid eq fDto.mid or member.manager eq 'Y'}">
					<%-- <form id="frm" action="${conPath}/fboard/delete.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}" onsubmit="return confirmSubmit();">
						<input type="submit" value="삭제">
					</form> --%>
					<button type="button" id="deleteBtn">삭제</button>
				</c:if>
				<button onclick="location='${conPath}/fboard/reply.do?fid=${param.fid }&pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">답변</button>
				<button onclick="location='${conPath}/fboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'">목록</button>
			</td>
		</tr>
	</table>
	
	
	<h3>댓글</h3>
	<form id="frm" action="${conPath }/fcomment/write.do" onsubmit="return confirmSubmit();">
		<input type="hidden" name="fid" value="${param.fid }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="mid" value="${member.mid }">
		<textarea rows="2" cols="5" name="fccontent" style="width:50%; height:50px; float:left; margin: 5px;"></textarea>
		<input type="submit" value="댓글 등록" class="btn" style="height:50px; float:left; margin: 5px;">
	</form>
	<p style="clear:both;"></p>
	<c:if test="${empty fcommentList }">등록된 댓글이 없습니다</c:if>
	<c:if test="${not empty fcommentList }">
		<c:forEach items="${fcommentList }" var="comment">
			<div class="reply${comment.fcid }">
				<div>
					<c:forEach var="i" begin="1" end="${comment.fcindent }">
						<c:if test="${i==comment.fcindent }">
				  			&nbsp; &nbsp; &nbsp; └
				  		</c:if>
						<c:if test="${i!=comment.fcindent }">
				  			&nbsp; &nbsp; &nbsp; 
				  		</c:if>
					</c:forEach>
					<span style="font-weight: blod; font-size: 1.3em;">${comment.fccontent }</span> 
					<i>ID: ${comment.mid} - 작성일시: ${comment.fcrdate }</i>
					<span class="btn" onclick="modifyComment(${comment.fcid}, ${param.pageNum}, ${fDto.fid}, ${commentPaging.currentPage})">[ 수정 ]</span>
					<%-- <span onclick="location='${conPath}/fcomment/delete.do?fcid=${comment.fcid }&fid=${param.fid }&pageNum=${param.pageNum }&commentPageNum=${commentPaging.currentPage }'" class="btn">[ 삭제 ]</span> --%>
					<span onclick="Swal.fire({
						  title: '삭제하시겠습니까?',
						  text: '삭제된 댓글은 복구할 수 없습니다.',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonText: '삭제',
						  cancelButtonText: '취소'
						}).then((result) => {
						  if (result.isConfirmed) {
						    location='${conPath}/fcomment/delete.do?fcid=${comment.fcid}&fid=${param.fid}&pageNum=${param.pageNum}&commentPageNum=${commentPaging.currentPage}';
						  }
						})" class="btn">[ 삭제 ]</span>
					<span id="${comment.fcid }" class="replyView" class="btn">[ 답변 ]</span>
				</div>
				<div class="replySpace${comment.fcid }"></div>
			</div>
			<br>
		</c:forEach>
	</c:if>
	<div class="paging">
		<c:if test="${commentPaging.startPage > commentPaging.blockSize }">
			[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${commentPaging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${commentPaging.startPage }" end="${commentPaging.endPage }">
			<c:if test="${i eq commentPaging.currentPage }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != commentPaging.currentPage }">
				[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/fboard/content.do?fid=${param.fid}&pageNum=${param.pageNum }&commentPageNum=${commentPaging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>