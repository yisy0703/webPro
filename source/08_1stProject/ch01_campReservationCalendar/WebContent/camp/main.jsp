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
	<style>
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('td').click(function(){
				var text = $(this).text();
				var preIdx = text.indexOf('<') + 1;
				var postIdx = text.indexOf('>'); 
				var cno = text.substring(preIdx, postIdx); // cno 추출함
				location.href='${conPath}/campReservationList.do?cno='+cno+'&mid=${member.mid }'
			});
		});
	</script>
</head>
<body>
	<div id="content_form">
		${member.mname }(${member.mid})님 로그인 함
		<div id="title">캠핑장 리스트</div>
		<table>
			<tr>
				<c:forEach var="camp" items="${camps }">
					<td style="position: relative;">
						<button class="reservation">예약중</button>
						<img src="${conPath }/campImage/${camp.image}"
								alt="${camp.cname }사진" width="300" >
						<p>
							<${camp.cno }> ${camp.cname }<br>
							이용대상 : ${camp.target }<br>
						</p>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>