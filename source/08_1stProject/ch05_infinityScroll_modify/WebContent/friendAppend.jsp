<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('button.modify').click(function(){
				var no = $(this).attr('id');
				var name = $('#name'+no).text();
				var tel = $('#tel'+no).text();
				var addr = $('#addr'+no).text();
				open('${conPath}/friendModifyView.do?no='+no+'&name='+name+'&tel='+tel+'&addr='+addr, '','width=800,height=50,left=500, top=200');
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty error }">
		<script>alert('${error}');</script>
	</c:if>
	<c:if test="${empty error }">
			<table>
				<c:forEach items="${friendList }" var="dto">
					<tr>
						<td>${dto.no }</td>
						<td id="name${dto.no }">${dto.name }</td>
						<td id="tel${dto.no }">${dto.tel }</td>
						<td id="addr${dto.no }">${dto.addr }</td>
						<td><button class="modify" id="${dto.no }" id="${dto.no }">수정</button></td>
					</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="pageNum" class="pageNum" value="${pageNum }">
	</c:if>
</body>
</html>