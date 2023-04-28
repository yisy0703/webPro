<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<c:if test="${empty noMore }">
		<table>
		<c:forEach items="${memoList }" var="memo">
			<tr>
				<td>${memo.id }</td>
				<td>${memo.content }</td>
				<td>${memo.rdate }</td>
				<td>${memo.ip }</td>
			</tr>
		</c:forEach>
		</table>
		<input type="hidden" name="pageNum" class="pageNum" value="${param.pageNum }">
	</c:if>
</body>
</html>