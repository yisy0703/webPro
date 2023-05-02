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
	#content {width: 800px; height:800px;margin: 50px auto;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
	function alert(msg) {
		Swal.fire(msg);
	}
</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/member/login.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member/modifyManager.do?pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}" method="post">
		<input type="hidden" name="mid" value="${memberDto.mid }">
		<input type="hidden" name="mnickname" value="${memberDto.mnickname }">
		<table>
			<tr><td>아이디</td><td>${memberDto.mid }</td></tr>
			<tr><td>닉네임</td><td>${memberDto.mnickname }</td></tr>
			<tr><td>이름</td><td>${memberDto.mname }</td></tr>
			<tr><td>이메일</td><td>${memberDto.mmail }</td></tr>
			<tr>
				<td>관리자</td>
				<td>
					<select name="manager">
						<option value="Y"
							<c:if test="${memberDto.manager eq 'Y' }">selected="selected"</c:if>
						>관리자</option>
						<option value="N" 
							<c:if test="${memberDto.manager eq 'N' }">selected="selected"</c:if>
						>일반회원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>회원상태</td>
				<td>
					<select name="mstate">
						<option value="Y"
							<c:if test="${memberDto.mstate eq 'Y' }">selected="selected"</c:if>
						>활동중</option>
						<option value="N" 
							<c:if test="${memberDto.mstate eq 'N' }">selected="selected"</c:if>
						>탈퇴</option>
						<option value="B" 
							<c:if test="${memberDto.mstate eq 'B' }">selected="selected"</c:if>
						>정지</option>
					</select>
				</td>
			</tr>
			<tr><td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="이전" onclick="location='${conPath }/member/list.do?pageNum=${param.pageNum}&schItem=${param.schItem}&schWord=${param.schWord}'">
			</td></tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>