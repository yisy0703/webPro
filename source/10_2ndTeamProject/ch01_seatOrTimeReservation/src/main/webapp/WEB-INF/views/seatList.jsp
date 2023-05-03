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
		input[type="checkbox"] {display: none;}
		input[type=submit] {
      background-image: url('${conPath}/img/reservation.png');
      background-size: 100%;
      width: 100px;
      height: 70px;
      background-color: white;
      display: block;
    }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('input[type="checkbox"]').click(function(){
				var seatId = $(this).attr('id');
				var checked = $(this).is(':checked');
				if(checked){ // 체크함
					$('.img'+seatId).attr('src','${conPath }/img/checked.png');
				}else { // 언체크함
					$('.img'+seatId).attr('src','${conPath }/img/on.png');
				}
			});
			
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:if test="${reserveResult eq true }">
		<script>swal('예약 완료','감사합니다','success');</script>
	</c:if>
	<form action="${conPath }/seatReservation.do">
		<input type="hidden" name="mid" value="${param.mid }">
		<c:forEach var="i" begin="0" end="9">
			<c:set var="seatId" value="a${i+1 }"/>
			
				<c:if test="${seats.get(i) == '' }">
					<label for="a${i+1 }">
					<span>${seatId}</span>
					<img src="${conPath }/img/on.png" class="imga${i+1 }">
					</label>
					<input type="checkbox" name="seatId" value="a${i+1}" id="a${i+1 }">
				</c:if>
				
				<c:if test="${seats.get(i) != '' }">
					<label for="a${i+1 }">
					<span>${seatId}</span>
					<img src="${conPath }/img/off.png" class="imga${i+1 }">
					</label>
					<input type="checkbox" name="seatId" value="a${i+1}" id="a${i+1 }" disabled="disabled">
				</c:if>
				<c:if test="${i%2 == 1 }">
					<br>					
				</c:if>
		</c:forEach>
		<input type="submit" value="">
	</form>
</body>
</html>