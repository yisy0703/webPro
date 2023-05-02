<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('select[name="category"]').change(function(){
				var category = $(this).val();
				if(category == 'B'){
					$('input[name="years"]').hide('slow');
				}else{
					$('input[name="years"]').show('slow');
				}
			});
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<form action="${conPath }/join.do" method="post">
		<table>
			<tr><td>이름</td><td><input type="text" name="name"></td></tr>
			<tr>
				<td>관계</td>
				<td>
					<select name="category">
						<option value="A">친구</option>
						<option value="B">지인</option>
					</select>
				</td>
			</tr>
			<tr><td>알고 지낸 년수</td><td><input type="number" name="years"></td></tr>
			<tr><td>전화번호</td><td><input type="text" name="tel"></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="친구등록">
					<input type="button" value="친구목록" onclick="location.href='${conPath}/list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>