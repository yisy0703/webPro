<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<style>
		#content {width: 800px; height:1200px;margin: 50px auto; }
		img{width: 100px;}
		a {text-decoration: none; color:black;}
		b {color:red;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script>
		function alert(msg) {
			Swal.fire(msg);
		}
	</script>
	<script>
		$(document).ready(function(){
			$('tr:not(:first-child)').click(function(){
				var mid = $(this).children().eq(0).text(); // 0번째 td안의 있는 text;
				location.href = '${conPath}/member/modifyManager.do?mid='+mid+'&pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}';
			});
		});
	</script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${modifyManagerResult eq SUCCESS }">
		<script>
			alert({
				position: 'top-end',
				icon: 'success',
				title: '관리자 모드로\n회원 수정하였습니다!',
				showConfirmButton: false,
				timer: 2000
			});
		</script>
	</c:if>
	<c:if test="${modifyManagerResult eq FAIL }">
		<script>
			alert({
				position: 'top-end',
				icon: 'error',
				title: '관리자 모드로\n회원 수정에 실패했습니다...',
				showConfirmButton: false,
				timer: 2000
			});
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div>
			<form action="${conPath }/member/list.do">
				<select name="schItem">
					<option value=""
						<c:if test="${param.schItem eq '' }">selected="selected"</c:if>
					>검색조건</option>
					<option value="mid" 
						<c:if test="${param.schItem eq 'mid' }">selected="selected"</c:if>
					>아이디</option>
					<option value="manager" 
						<c:if test="${param.schItem eq 'manager' }">selected="selected"</c:if>
					>관리자(Y) 일반회원(N)</option>
				</select>
				<input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색">
			</form>
		</div>
		<table>
			<caption>회원 목록</caption>
			<tr>
				<th>아이디</th><th>닉네임</th><th>이름</th><th>이메일</th>
				<th>가입일</th><th>관리자</th><th>가입상태</th>
			</tr>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.mid }</td>
					<td>${member.mnickname }</td>
					<td>${member.mname }</td>
					<td>${member.mmail }</td>
					<td><fmt:formatDate value="${member.mdate }" type="date" dateStyle="short"/></td>
					<td>
						<c:if test="${member.manager eq 'Y'}">관리자</c:if>
						<c:if test="${member.manager eq 'N'}">일반회원</c:if>
					</td>
					<td>
						<c:if test="${member.mstate eq 'Y'}">활동중</c:if>
						<c:if test="${member.mstate eq 'N'}">탈퇴</c:if>
						<c:if test="${member.mstate eq 'B'}">정지</c:if>
					</td>
				</tr>
			</c:forEach>
		</table><br>
		<div>
			<c:if test="${paging.startPage>paging.blockSize}">
				[ <a href="${conPath }/member/list.do?pageNum=${paging.startPage-1 }&schItem=${param.schItem}&schWord=${param.schWord}">이전</a> ]
			</c:if>	
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }"> 
					<b>[ ${i } ]</b> 
				</c:if>
				<c:if test="${paging.currentPage != i }">
					[ <a href="${conPath }/member/list.do?pageNum=${i }&schItem=${param.schItem}&schWord=${param.schWord}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage<paging.pageCnt }">
				[ <a href="${conPath }/member/list.do?pageNum=${paging.endPage+1 }&schItem=${param.schItem}&schWord=${param.schWord}">다음</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>