<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		tr td:nth-child(1), tr th:nth-child(1) {width:40px;}
		tr td:nth-child(2), tr th:nth-child(2)  {width:50px;}
		tr td:nth-child(3), tr th:nth-child(3)  {width:150px;}
		tr td:nth-child(4), tr th:nth-child(4)  {width:150px;}
		tr td:nth-child(1) input {width:35px;}
		tr td:nth-child(2) input {width:45px;}
		tr td:nth-child(3) input  {width:145px;}
		tr td:nth-child(4) input  {width:145px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('input[type="button"]').click(function(){
				opener.document.getElementById('name${param.no}').innerHTML = $('input[name="name"]').val();
				opener.document.getElementById('tel${param.no}').innerHTML = $('input[name="tel"]').val();
				opener.document.getElementById('addr${param.no}').innerHTML = $('input[name="addr"]').val();
				$('form').submit();
			});
		});
	</script>
</head>
<body>
	<form action="${conPath }/friendModifyAjax.do">
		<table>
			<tr>
				<td><input type="text" name="no" value="${param.no }" readonly="readonly"></td>
				<td><input type="text" name="name" value="${param.name }"></td>
				<td><input type="text" name="tel" value="${param.tel }"></td>
				<td><input type="text" name="addr" value="${param.addr }"></td>
				<td><input type="button" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>