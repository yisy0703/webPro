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
			$('select[name="year"], select[name="month"]').change(function(){
				$('form').submit();
			});
			
			$('td.reservationTd').click(function(){
				// 오늘 날짜
				var now = new Date();
				var nowYear = now.getFullYear();
				var nowMonth = now.getMonth()+1;
				var nowDay = now.getDate();
				var today = nowYear + '-' + (nowMonth<10 ? "0"+nowMonth : nowMonth) + '-' + (nowDay<10 ? "0"+nowDay : nowDay);
				// 파라미터로 넘길 날짜
				var day = $(this).attr('id');
				month = '${month}';
				if(month<10){
					month = '0'+month;
				}
				if(day<10){
					day = '0'+day;
				}
				reservationDate = '${year}-' + month + '-' + day;
				if(today < reservationDate){
					alert(reservationDate+'에 예약한다');
					location.href = '${conPath}/reservation.do?year=${year}&month=${month}&mid=${param.mid}&cno=${param.cno}&reservationDate='+reservationDate;
				}else{
					alert('내일부터 예약 가능');
				}
			});
		});
	</script>
</head>
<body>
${member.mname }(${member.mid})님 로그인 함
<c:if test="${reservationResult == 1}">
	<script>alert('예약 성공');</script>
</c:if>
<c:if test="${reservationResult == 0}">
	<script>alert('예약 실패');</script>
</c:if>
	<div id="content_form">
		<div id="title">${camp.cno }. ${camp.cname } : ${camp.target }</div>
		<b>
			<form action="${conPath }/campReservationList.do">
				<input type="hidden" name="cno" value="${param.cno }">
				<input type="hidden" name="mid" value="${param.mid }">
				<select name="year">
					<c:forEach var="i" begin="${year }" end="${year+10 }">
						<c:if test="${i eq year }">
							<option selected="selected">${i }</option>
						</c:if>
						<c:if test="${i != year }">
							<option>${i }</option>
						</c:if>
					</c:forEach>
				</select> 년
				<select name="month">
					<c:forEach var="i" begin="1" end="12">
						<c:if test="${i eq month }">
							<option selected="selected">${i }</option>
						</c:if>
						<c:if test="${i != month }">
							<option>${i }</option>
						</c:if>
					</c:forEach>
				</select> 월
			</form>
		</b>
		<table>
			<tr>
				<c:forEach var="t" items="${calPrint.title }">
					<th>${t }</th>
				</c:forEach>
			</tr>
			<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="6">
						<c:if test="${empty calPrint.calDate[i][j] }">
							<td style="background-color: white;"></td>
						</c:if>
						<c:if test="${not empty calPrint.calDate[i][j] }">
								<c:set var="reserved" value="0"/>
								<c:forEach var="reservation" items="${reservations }">
									<c:if test="${calPrint.calDate[i][j] == reservation.day }">
										<td style="color:#cccccc; background-color: #FFE271; cursor: default;">
											<h3>${calPrint.calDate[i][j] }</h3>
											<span>예약됨</span><br>
										</td>
										<c:set var="reserved" value="1"/>
									</c:if>
								</c:forEach>
								<c:if test="${reserved == 0 }">
									<td style="color:black;" class="reservationTd" id="${calPrint.calDate[i][j] }">
											<h3>${calPrint.calDate[i][j] }</h3>
											<span> &nbsp; &nbsp; &nbsp; </span><br>
										</td>
								</c:if>
							
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>