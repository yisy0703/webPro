<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="groupContent_detailContentWrapper">
				<h2 class="groupContent_detailInfo">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 소개</h2>
				<pre>${groupDetail.gcontent }</pre>
	</div>
	<div class="groupContent_btns">
		<c:if test="${not empty member}">
			<c:if test="${groupDetail.mid ne member.mid and joincheck eq 0}">
				<button onclick="location='join.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">참가 신청</button>
			</c:if>
			<c:if test="${groupDetail.mid ne member.mid and joincheck eq 1}">
				<button onclick="location='unJoin.do?gid=${groupDetail.gid}&mid=${member.mid}&pageNum=${param.pageNum}'">신청 취소</button>
			</c:if>
					
			<c:if test="${groupDetail.mid eq member.mid or (not empty member and member.manager eq 'Y')}">
				<button onclick="location='modify.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">수정</button>
				<button onclick="location='delete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">삭제</button>
				<button onclick="location='complete.do?gid=${groupDetail.gid}&pageNum=${param.pageNum}'">삭제</button>
			</c:if>
		</c:if>
		<c:if test="${empty member}">
			<button onclick="location='${conPath}/member/login.do'">참가 신청</button>
		</c:if>
	</div>
	<div class="studyContent_detailComment">
		<div class="commentInput_commentText">
			<hr>
			<h2>${commentCnt }개의 댓글이 있습니다.</h2>
			<c:if test="${not empty member }">
				<form action="${conPath}/group/comment.do" method="post">
					<textarea class="commentInput_commentText_textarea" placeholder="댓글을 입력하세요."></textarea>
					<div class="contentInput_buttonWrapper">
							<button class="comentInput_buttonSubmit">댓글 등록</button>
					</div>
				</form>
			</c:if>
		</div>
		<c:if test="${not empty groupComment }">
			<hr>
			<ul class="commentList">
				<c:forEach var="dto" items="${groupComment }">
					<li class="commentItem_commentContainer">
						<div class="commentItem_commentHeader">
							<form action="${conPath}/group/commentModify.do" method="post">
								<input type="hidden" name="gid" value=${dto.gid }>
								<input type="hidden" name="gcid" value=${dto.gcid }>
								<input type="hidden" name="pageNum" value=${param.pageNum }>
								<div class="commentItem_writer"><img src="" class="commentItem_userImg" alt="사용자 이미지">
									<div class="commentItem_commentInfo">
										<div class="commentItem_title">
											<div class="commentItem_userNickname">${dto.mnickname }</div>
											<div class="commentItem_registerDate">${dto.gcrdate }</div>
										</div>
									</div>
								</div>
								<c:if test="${(not empty member and dto.mid eq member.mid) or (member.manager eq 'Y')}">
									<span><a class="comment_modify" style="color : black; text-decoration:none; cursor:pointer">수정 </a></span>
									<span><a href="${conPath}/GCommentDelete.do?gid=${dto.gid}&gcid=${dto.gcid}" style="color : black; text-decoration:none;">삭제</a></span><br>
								</c:if>
							</form>
						</div>
						<div class="commentItem_commentContent">
							<p class="commentItem_commentContent">${dto.gccontent }</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</body>
</html>