<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/emp.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
		<form action="" method="get">
			사원명 <input type="text" name="ename" size="5">
			직책   <input type="text" name="job" size="5">
			부서번호 
			<select name="deptno">
				<option value="0">모든 부서</option>	
				<c:forEach var="dept" items="${deptList }">
					<option value="${dept.deptno }">
						${dept.deptno }-${dept.dname }
					</option>
				</c:forEach>
			</select>
			<input type="submit" value="검색">
		</form>
		${empList }	
	</div>
</body>
</html>













