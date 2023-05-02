<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Pronect</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="${conPath }/css/main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(function(){
			$('#searchBtn').click(function(){
				var searchtxt = $('#searchtxt').val();
				location.href= '${conPath}/searchGroup.do?cgName='+searchtxt;
			});
		});
	</script>
	<style>
		.image{
			width:30px;
			height:30px;
		}
		.language{
			width:40px;
			height:40px;
		}
		.commentCnt, .hit{
			width:15px;
			height:15px;
		}
		
		.language{
			display: inline;
		}
		#hitCnt{
			color:gray;
			text-decoration: none;
		}
		.hit{
			margin : 0 10px 0 40px;
		}
		.commentCnt{
			margin : 0 10px 0 10px;
		}
		.titleContent{
			height:100px;
		}
		.mnickname{
			text-decoration: none;
			width: 40px;
			line-height: 39px;
		}
	</style>
</head>
<body class="is-preload">
<c:set var="SUCCESS" value="1"/>
<c:set var="FAIL" value="0"/>
<c:if test="${member.mstate eq 'N'}">
    <script>
        $(document).ready(function() {
            Swal.fire({
                icon: 'error',
                title: '탈퇴한 회원입니다',
                text: '탈퇴한 회원으로 현재 로그인이 불가합니다.',
                footer: '<a href="mailto:teamPronect@gmail.com?subject=[ProNect 탈퇴복구신청]아이디:&body=[이름]:%0D%0A%0D%0A[닉네임]:%0D%0A%0D%0A[상세내용]:">탈퇴 복구신청을 원하시나요?</a>'
            }).then(function() {
                location.href="${conPath}/member/logout.do";
            });
        });
    </script>
</c:if>
<c:if test="${member.mstate eq 'B'}">
	<script>
        $(document).ready(function() {
            Swal.fire({
                icon: 'error',
                title: '활동 정지된 회원입니다',
                text: '활동 정지된 회원으로 현재 로그인이 불가합니다.',
                footer: '<a href="mailto:teamPronect@gmail.com?subject=[ProNect 정지복구신청]아이디:&body=[이름]:%0D%0A%0D%0A[닉네임]:%0D%0A%0D%0A[상세내용]: 명확한 사유로 정지를 당한 경우 절대 복구되지 않습니다.">부당한 정지를 당했다고 생각하시면 복구 신청을 해주세요</a>'
            }).then(function() {
                location.href="${conPath}/member/logout.do";
            });
        });
    </script>
</c:if>
<c:if test="${member.mstate eq 'Y' && not empty loginResult}">
	<script>
        $(document).ready(function() {
        	Swal.fire({
        		  title: '안녕하세요, ${member.mnickname} 님?\n ProNect에서 즐겁고 가치있는 경험을\n하시길 바랍니다.',
        		  width: 800,
        		  padding: '2em',
        		  color: '#716add',
        		  /* background: '#fff url(${conPath}/images/charlesdeluvio-Lks7vei-eAg-unsplash.jpg)', */
        		  backdrop: `
        		    rgba(0,0,123,0.4)
        		    url("${conPath}/images/nyan-cat.gif")
        		    left top
        		    no-repeat
        		  `
        		});
        });
    </script>
</c:if>
<c:if test="${deactivateResult eq SUCCESS}">
	<script>
        $(document).ready(function() {
            Swal.fire({
                icon: 'success',
                title: '회원 탈퇴가 완료되었습니다',
                text: '다음에 다시 만나길 바라요~',
                footer: '<a href="mailto:teamPronect@gmail.com?subject=[ProNect 탈퇴복구신청]아이디:&body=[이름]:%0D%0A%0D%0A[닉네임]:%0D%0A%0D%0A[상세내용]:">탈퇴 복구신청을 원하시면 클릭하세요. 나중에라도 가능합니다.</a>'
            }).then(function() {
                location.href="${conPath}/member/logout.do";
            });
        });
    </script>
</c:if>
<c:if test="${joinResult eq SUCCESS }">
	<script>
		Swal.fire({
			position: 'top-end',
			icon: 'success',
			title: '회원가입이 완료되었습니다!',
			text: '환영합니다~',
			showConfirmButton: false,
			timer: 2000
		});
	</script>
</c:if>
<c:if test="${joinResult eq FAIL }">
	<script>
		Swal.fire({
			position: 'top-end',
			icon: 'success',
			title: '회원가입에 실패했습니다...',
			text: '어떤 문제가 있는 것 같습니다',
			footer: '<a href="history.back()">회원가입 페이지로 돌아가기</a>'
			showConfirmButton: true
		});
	</script>
</c:if>
<jsp:include page="header.jsp"/>
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div id="banner">
				<a href="#"><img src="${conPath}/images/pronect_banner.png" class="banner"></a>
			</div>
			<nav id="nav">
				<ul>
					<c:if test="${not empty member }">
						<li><a href="${conPath}/group/groupList.do?mid=${member.mid}&pageNum=1">전체</a></li>
						<li><a href="${conPath}/group/studyList.do?mid=${member.mid}&pageNum=1">스터디</a></li>
						<li><a href="${conPath}/group/projectList.do?mid=${member.mid}&pageNum=1">프로젝트</a></li>
						<li style="float:right; margin-right:70px;"><a href="${conPath}/group/register.do">새 글 쓰기</a></li>
					</c:if>
					<c:if test="${empty member }">
						<li><a href="${conPath}/group/groupList.do?pageNum=1">전체</a></li>
						<li><a href="${conPath}/group/studyList.do?pageNum=1">스터디</a></li>
						<li><a href="${conPath}/group/projectList.do?pageNum=1">프로젝트</a></li>
					</c:if>
				</ul>
				<div class="search_div">
					<input type="text" placeholder="스터디/프로젝트를 검색하세요" class="searchtxt"><img src="${conPath }/images/searchIcon.png" id="searchBtn">
				</div>
			</nav>
			<br>
			<div class="inner">
				<section class="tiles">
					<c:if test="${not empty list}">
						<c:forEach var="dto" items="${list }">
							<article class="style">
								<div>
									<a href="${conPath}/group/detail.do?name=${name }&gid=${dto.gid}&pageNum=${paging.currentPage}" title="${dto.gtitle }">
										<div class="content">
											<div class="titleContent">
												<h2 class="gtitle">${dto.gtitle }</h2>
												<p class="gcontent">${dto.gcontent }</p>
											</div>
											<p style="height:40px;">
												<c:if test="${not empty dto.glanguage1}">
													<img class="language" style="border-radius: 50px;" src="${conPath }/logos/${dto.glanguage1}.png" alt="${dto.glanguage1}">
												</c:if>
												<c:if test="${not empty dto.glanguage2}">
													<img class="language" style="border-radius: 50px;" src="${conPath }/logos/${dto.glanguage2}.png" alt="${dto.glanguage2}">
												</c:if>
												<c:if test="${not empty dto.glanguage3}">
													<img class="language" style="border-radius: 50px;" src="${conPath }/logos/${dto.glanguage3}.png" alt="${dto.glanguage3}">
												</c:if>
											<hr>
											<div>
												<p class="writer">
													<img class="image" style="border-radius: 50px;" src="${conPath }/memberFile/${dto.mimage}" alt="사용자 이미지"><span class="mnickname"> ${dto.mnickname}</span>
													<span id="hitCnt"><img class="hit" src="${conPath }/logos/hit.png" alt="조회수">${dto.ghit }<img class="commentCnt" src="${conPath }/logos/comment.png" alt="댓글수">${dto.comment_count}</span>
												</p>
											</div>
										</div>
									</a>
								</div>
							</article>
						</c:forEach>
					</c:if>
				</section>
				<div id="div_paging">
					<c:if test="${paging.startPage>paging.blockSize}">
						[ <a href="${conPath }/group/${name}List.do?pageNum=${paging.startPage-1 }">이전</a> ]
					</c:if>	
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						<c:if test="${paging.currentPage==i }"> 
							<b>[ ${i } ]</b> 
						</c:if>
						<c:if test="${paging.currentPage != i }">
							[ <a href="${conPath }/group/${name}List.do?pageNum=${i }">${i }</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage<paging.pageCnt }">
						[ <a href="${conPath }/group/${name}List.do?pageNum=${paging.endPage+1 }">다음</a> ]
					</c:if>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>