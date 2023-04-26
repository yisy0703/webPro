<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('input[name="all"]').click(function(){
				if($('input[name="all"]').is(":checked")){
					$('input[name=deptnos]').prop('checked', true);
				}else{
					$('input[name=deptnos]').prop('checked', false);
				}
			});
			$('input').click(function(){
				let totCnt = $('input[name="deptnos"]').length;
				let chkCnt = 0;
				$('input[name="deptnos"]').each(function(idx, item){
					if(item.checked){
						chkCnt ++;
					}
				});
				if(chkCnt==totCnt){
					$('input[name=all]').prop('checked', true);
				}else{
					$('input[name=all]').prop('checked', false);
				}
				$('form').submit();
			});
		});
	</script>
</head>
<body>
	<div align="center">
		<form action="list.do">
			<input type="checkbox" name="all" value="all"
				<c:if test="${param.all == 'all' }">
					checked="checked"
				</c:if>
			>전부<br>
			<c:forEach items="${deptList }" var="dept">
				<input type="checkbox" name="deptnos" value="${dept.deptno }" class="d"
					<c:forEach items="${paramValues.deptnos }" var="no">
						<c:if test="${no eq dept.deptno }">
							checked="checked"
						</c:if>
					</c:forEach>
				>${dept.dname }
			</c:forEach>
			<input type="submit">
		</form>
	</div>
	<div id="content">
		<table>
			<tr>
				<th>사번</th><th>이름</th><th>직책</th><th>상사</th><th>입사일</th><th>급여</th><th>상여</th><th>부서번호</th>
			</tr>
			<c:if test="${empList.size() eq 0 }">
				<tr><td colspan="8">검색하고자 하는 부서의 직원이 없습니다</td></tr>
			</c:if>
			<c:forEach var="emp" items="${empList }">
				<tr>
					<td>${emp.empno }</td>
					<td>${emp.ename }</td>
					<td>${emp.job }</td>
					<td>${emp.mgr }</td>
					<td><fmt:formatDate value="${emp.hiredate }" pattern="yy/MM/dd(E)"/> </td>
					<td>${emp.sal }</td>
					<td>${emp.comm }</td>
					<td>${emp.deptno }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>