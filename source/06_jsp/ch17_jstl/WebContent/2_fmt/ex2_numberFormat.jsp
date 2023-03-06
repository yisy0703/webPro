<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:set var="num" value="1234567.56"/>
	<p>num : ${num }</p>
	<p>세자리마다 , : <fmt:formatNumber value="${num }" groupingUsed="true"/></p>
	<p>세자리마다 , : <fmt:formatNumber value="${num }" pattern="#,###.#"/>(소수점 한자리까지나오도록 반올림)</p>
	<p>세자리마다 , : <fmt:formatNumber value="${num }" pattern="#,###.###"/></p>
	<c:set var="pi" value="3.14159"/>
	<p>pi : <fmt:formatNumber value="${pi }" pattern="#,###.###"/></p>
	<p>pi : <fmt:formatNumber value="${pi }" pattern="000.000000"/></p>
</body>
</html>
















