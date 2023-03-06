<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>core 라이브러리 태그 : if, for, choose, set, ...</h2>
	<c:forEach var="i" begin="1" end="3" step="1">
		<p>${i }번째 안녕하세요</p>
	</c:forEach>
	<%-- <%for(int i=1 ; i<=3 ; i++){%>
			<p><%=i %>번째 안녕하세요</p>
	<%}%> --%>
	<hr>
	<c:forEach begin="1" end="3" step="1">
		<p>안녕하세요</p>
	</c:forEach>
	<h2>fmt(formatting) 라이브러리 : 날짜나 숫자 format, 다국어지원</h2>
	<fmt:formatNumber value="3333333.149" pattern="#,###.##"/>
	<h2>그 외 라이브러리(functions) : fn라이브러리는 el표기법과 함께 사용</h2>
	id 파라미터를 대문자로 : ${fn:toUpperCase(param.id) }<br>
	id 파라미터를 대문자로 : ${param.id.toUpperCase() }
</body>
</html>











