<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pronect</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/main.js"></script>
	<script src="${conPath}/js/fullcalendar-5.0.1/lib/locales/ko.js"></script>
	<link href="${conPath}/js/fullcalendar-5.0.1/lib/main.css" rel="stylesheet" />
	<link href="${conPath }/css/groupDetail.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/gh/ka215/jquery.timeline@main/dist/jquery.timeline.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/gh/ka215/jquery.timeline@main/dist/jquery.timeline.min.js"></script>
	<!-- FullCalendar Script -->
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			$(function () {
				var request = $.ajax({
					url: "${conPath}/group/schedule/list.do?gid="+${groupDetail.gid},
					method: "GET",
					dataType: "json",
				});
			
				request.done(function (data) {
					console.log(data);
					
					var calendarEl = document.getElementById('calendar');
					
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView: 'dayGridMonth',
						headerToolbar: {
							left: 'prev,next',
							center: 'title',
							right: 'today',
						},
						titleFormat : function(date) {
						  return date.date.year +"년 "+(date.date.month +1)+"월"; 
						}, 
						editable: true,
						droppable: true,
						drop: function (arg) {
						if (document.getElementById('drop-remove').checked) {
							arg.draggedEl.parentNode.removeChild(arg.draggedEl);
							}
						},
						events: data,
						dateClick: function(info) {
							alert('ee');
						}, 
						eventClick: function(info) {
				    	let today = new Date();   
				    	let year = today.getFullYear();
				    	let month = ('0' + (today.getMonth() + 1)).slice(-2);
				    	let day = ('0' + today.getDate()).slice(-2);
				    	let todayStr = year + '-' + month + '-' + day;
							if (!confirm(info.event.startStr+" 일정 ("+info.event.title+")에 참여하셨습니까?")) {
					    	alert("취소(아니오)를 누르셨습니다.");
					    } else {
					    	if (info.event.startStr == todayStr) {
					    		alert("확인(예)을 누르셨습니다.");
					    		location.href='group/schedule/';
					    	}else {
					    		alert("스터디 당일에만 참석이 가능합니다.");
					    	}
					    	
					    }
						    alert('그룹아이디: ' + info.event.groupId);
						    alert('아이디: ' + info.event.id);
						  }
					});
				
					calendar.render();
				});
				
				request.fail(function( jqXHR, textStatus ) {
						alert( "Request failed: " + textStatus );
					});
			});
		
		});
	</script>
	<!-- NAV Ajax Script -->
	<script>
	$(document).ready(function(){
		document.getElementById('calendar').style.display = 'none';
		$.ajax({
			url : '${conPath}/group/groupInfo.do',
			datatype : 'html',
			data : "gid="+${groupDetail.gid},
			success : function(data, status){
				$('.groupDetail').html(data);
			}
		});
		$('#groupDetail_info').click(function(){
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/group/groupInfo.do',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
		$('#groupDetail_schedule').click(function(){
			$('.groupDetail').html('');
			document.getElementById('calendar').style.display = 'block';
			document.getElementsByClassName('fc-prev-button fc-button fc-button-primary')[0].click();
			document.getElementsByClassName('fc-next-button fc-button fc-button-primary')[0].click();
			$.ajax({
				url : '${conPath}/group/schedule/myGroupSchedule.do',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
		$('#groupDetail_memberInfo').click(function(){
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/group/memberInfo.do',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
		$('#groupDetail_gantt').click(function(){
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/group/schedule/gantt.do',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
		$('#groupDetail_board').click(function(){
			document.getElementById('calendar').style.display = 'none';
			$('.groupDetail').html('');
			$.ajax({
				url : '${conPath}/groupBoard/list.do?',
				datatype : 'html',
				data : "gid="+${groupDetail.gid},
				success : function(data, status){
					$('.groupDetail').html(data);
				}
			});
		});
	});
	</script>
<style>
	#main{
		width:1000px;
		margin:0 auto;
	}
	#back {
		width: 1000px;
		margin: 0 auto;
	}
	#groupDetail{
		width: 1000px;
		margin: 0 auto;
	}
	#sideBanner{
		width:200px;
		position:fixed;
		top:200px;
		right:200px;
	}
	#sideBanner_hitGroup{
		display: block;
		white-space:nowrap;
		overflow:hidden;
	}
	#sideBanner_hitGroup li::marker{
		color : blue;
		
	}
	#sideBanner_hitGroup_border{
		border-radius: 10px;
		border:solid gray 2px;
	}
	.back{
		width : 30px;
		text-align: left;
	}
	button{
		text-align: center;
	}
	#commentContent{
		border-radius: 10px;
	}
	#submitBtn{
		border-radius: 20px;
		background-color:black;
		color:white;
	}
</style>
</head>
<c:if test="${not empty acceptResult }">
	<script>
		alert('${acceptResult}');
	</script>
</c:if>
<body>
	<jsp:include page="../main/header.jsp"/>
<!-- ---------------------------------------------------추천글-------------------------------------------------------------------- -->
	<div id="sideBanner">
		오늘의 추천글
		<fieldset class="sideBanner_hitGroup_border">
			<ol type="1">
				<c:forEach var="dto" items="${hitGroup}">
					<li id="sideBanner_hitGroup"><a href="${conPath}/group/detail.do?name=${name }&gid=${dto.gid}&pageNum=${paging.currentPage}">${dto.gtitle }</a></li>
				</c:forEach>
			</ol>
		</fieldset>
	</div>
<!-----------------------------------------------------그룹 본문------------------------------------------------------------------->
	<div id="main">
		<div class="groupContent_detailHeader">
			<div id="back">
				<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
			</div>
				<div class="groupDetail_title">${groupDetail.gtitle }</div>
<!-----------------------------------------------그룹리더 정보------------------------------------------------------------------->
				<div class="groupDetail_writer">
					<div class="mimage"><img src="${conPath}/memberFile/${groupDetail.mimage}" alt="사용자 이미지"></div><div class="mid">${groupDetail.mnickname } |</div>
					<div class="grdate">작성일: ${groupDetail.grdate }</div>
					<c:if test=" ${empty groupDetail.mimage}">
						이미지 비어있음
					</c:if>
				</div>
				<p style=clear:both;></p>
<!-------------------------------------------------그룹 정보--------------------------------------------------------------------->
				<div class="groupContent_detail">
					<ul class="groupInfo_groupGrid">
						<li>
							<span class="groupInfo_title">모집 구분 </span>
							<span class="groupInfo_content">
								<c:if test="${groupDetail.gcharacter eq 'P' }">
									<b>프로젝트</b>
								</c:if>
								<c:if test="${groupDetail.gcharacter eq 'S'}">
									<b>스터디</b>
								</c:if>
							</span>
						</li>
						<li>
							<span class="groupInfo_title">모집 인원</span>
							<span class="groupInfo_content">${groupDetail.gpeople }명 </span>
						</li>
						<li>
							<span class="groupInfo_title">시작 예정</span>
							<span class="groupInfo_content">${groupDetail.gsdate }  </span>
						</li>
						<li>
							<span class="groupInfo_title">지역</span>
							<span class="groupInfo_content">${groupDetail.gloc } </span>
						</li>
						<li>
							<span class="groupInfo_title">완료 예정</span>
							<span class="groupInfo_content">${groupDetail.gfdate } </span>
						</li>
						<li>
							<span class="groupInfo_title">사용 언어</span>
							<span class="groupInfo_content_lang">
								<c:if test="${empty groupDetail.glanguage1 and empty groupDetail.glanguage2 and empty groupDetail.glanguage3}">
									-
								</c:if>
								<c:if test="${not empty groupDetail.glanguage1 }">
										${groupDetail.glanguage1 }
								</c:if>
								<c:if test="${not empty groupDetail.glanguage2 }">
										 / ${groupDetail.glanguage2 }
								</c:if>
								<c:if test="${not empty groupDetail.glanguage3 }">
										 / ${groupDetail.glanguage3 }
								</c:if>
							</span>
						</li>
					</ul>
				<p style=clear:both;></p>
				</div>
				<nav id="mygroup_nav">
					<ul>
						<li>
						<p id="groupDetail_info">
								${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 정보</p>
						</li>
						<li>
							<p id="groupDetail_schedule"> ${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 일정</p>
							<!-- <a href="${conPath }/group/schedule/myGroupSchedule.do?gid=${groupDetail.gid }">test</a> -->
						</li>
						<c:if test="${groupDetail.gcharacter eq 'P' }">
						<li><p id="groupDetail_gantt">Gantt 계획표</p></li>
						</c:if>
						<li><p id="groupDetail_board">${groupDetail.gcharacter eq 'P'? '프로젝트':'스터디'} 게시판</p></li>
						<c:if test="${groupDetail.mid eq member.mid }">
							<li><p id="groupDetail_memberInfo">멤버 정보</p></li>
						</c:if>
					</ul>
					<p style=clear:both;></p>
				</nav>
			</div>
			<div id='calendar'>
			</div>
			<div class="groupDetail">
			</div>
	<!----------------------------------------------------- 댓글 ------------------------------------------------------->
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>