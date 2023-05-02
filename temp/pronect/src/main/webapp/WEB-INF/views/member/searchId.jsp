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
	#content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/member/searchId.do" method="post">
		<table>
			<caption>아이디 찾기</caption>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mname" required="required" ></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="mmail" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="아이디 찾기">
					<input type="button" value="이전" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
