<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/emp.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('input[type=text]').keyup(function(){
				$('form').submit();
			});
		});
		$(function(){
			$('select').change(function(){
				$('form').submit();
			});
		});
			
	</script>
</head>
<body>
<div id="wrap">
  	<form action="${conPath }/emp.do">
  		사원명 <input type="text" name="ename" value="${searchEmp.ename }" size="5">
  		직책 <input type="text" name="job" value="${searchEmp.job }" size="5">
  		부서번호 <select name="deptno">
  			<option value="0">모든 부서</option>
  			<c:forEach items="${deptList }" var="dept">
  				<option value="${dept.deptno }"  
  					<c:if test="${dept.deptno==searchEmp.deptno }">selected="selected"</c:if>
  				>${dept.dname }</option>
  			</c:forEach>
  		</select>
  		<input type="submit" value="검색">
  	</form>
  </div>
  <table>
  	<tr><th>사원번호</th><th>이름</th><th>직책</th><th>mgr</th><th>입사일</th>
  			<th>급여</th><th>상여</th><th>부서번호</th></tr>
  	<c:forEach var="e" items="${empList}">
			<tr><td>${e.empno }</td>
				<td>${e.ename }</td>
				<td>${e.job }</td>
				<td>${e.mgr }</td>
				<td><fmt:formatDate value="${e.hiredate }" pattern="yy년MM월dd일 E요일"/> </td>
				<td align="right"><fmt:formatNumber value="${e.sal }" pattern="#,###"/></td>
				<td align="right"><fmt:formatNumber value="${e.comm }" pattern="#,####"/></td>
				<td>${e.deptno }</td>
			</tr>
		</c:forEach>
  </table>
</body>
</html>