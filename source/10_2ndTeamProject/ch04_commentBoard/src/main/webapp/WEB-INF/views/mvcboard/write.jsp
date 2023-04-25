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
</head>
<body>
	<form action="${conPath }/mvcboard/write.do" method="post">
		<table>
			<caption>원글쓰기</caption>
			<tr><th>작성자</th><td><input type="text" name="bname" required="required"></td></tr>
			<tr><th>제목</th><td><input type="text" name="btitle" required="required"></td></tr>
			<tr><th>분문</th><td><textarea rows="5" cols="20" name="bcontent"></textarea></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" 
													onclick="location='${conPath}/mvcboard/list.do'" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

















