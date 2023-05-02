<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<h2>${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판 </h2>
	<form action="">
		<table>
			<c:if test="${not empty groupBoard }">
				<tr>
					<td>${groupBoard.group_board_title }</td>
					<td>${groupBoard.mid }</td>
					<td>${groupBoard.group_board_content }</td>
					<td>${groupBoard.group_board_like }</td>
					<td>${groupBoard.group_board_hit }</td>
					<c:if test="${groupBoard.rep_cnt != 0 }">
						<td><b>${groupBoard.rep_cnt }</b></td>
					</c:if>
				</tr>
			</c:if>
			<tr>
				<td><input type="text" name="searchGroupBoard"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>
</body>
</html>