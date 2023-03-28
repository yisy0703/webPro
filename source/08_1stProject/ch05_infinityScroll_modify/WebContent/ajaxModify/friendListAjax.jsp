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
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			var pageCnt = Number('${pageCnt}');
			var totCnt = Number('${totCnt}');
			if(totCnt <= 5){
				alert('전체 갯수가 PAGESIZE인 5이하 갯수만 있으면 더보기 버튼 안 나옴');
				$('button').css('display','none');
			}
			$('button.append').click(function(){
				pageNum = Number($('.pageNum').last().val());
				if(isNaN(pageNum)){
					pageNum = 1;
				}
				$.ajax({
					url : '${conPath}/friendAppendAjax.do',
					type : 'get',
					dataType : 'html',
					data : {'pageNum': (pageNum+1)},
					success : function (data) {
						$('#appendDiv').append(data);
						pageNum = Number($('.pageNum').last().val());
						if(pageCnt <= pageNum){
							alert('마지막 페이지까지 뿌려서 더보기 버튼 없앱니다');
							$('button').css('display','none');
						}//if문
					},
				});// ajax 함수
			});// 더보기 버튼
			// 무한스크롤 - 끝까지 가면 스크롤 이벤트 제거
			$(window).scroll(function(){
				pageNum = Number($('.pageNum').last().val());
				if(isNaN(pageNum)){
					pageNum=1;
				}
				//$(document).scroll() // 스크롤이 변경될때마다 이벤트를 발생시킴
				//$(document).height() // 현재페이지(문서)의 높이
				//$(window).height() // 윈도우의 크기
				//$(window).scrollTop() // 브라우저의 스크롤 위치값
				//console.log('브라우저 스크롤 위치값($(window).scrollTop()) : ' + $(window).scrollTop());
				//console.log('현재페이지(문서)의 높이($(document).height()): ' + $(document).height());
				//console.log('윈도우의 크기($(window).height()) : ' + $(window).height());
				if($(window).scrollTop() + 30 >= $(document).height()-$(window).height() && (pageNum < pageCnt)){
					// 30은 현재 스크롤 위치 값이 약간의 보정치를 추가한 부분.
					// 이를 사용하여 사용자가 반드시 최하단이 아니라 하단보다 조금 위에 위치했더라도 미리 새로운 콘텐츠가 추가될 수 있다.
					$.ajax({
						url : '${conPath}/friendAppendAjax.do',
						type : 'get',
						dataType : 'html',
						data : {'pageNum': (pageNum+1)},
						success : function (data) {
							$('#appendDiv').append(data);
							pageNum = Number($('.pageNum').last().val());
							if(pageCnt == pageNum){
								alert('마지막 페이지까지 뿌려서 더보기 버튼 없앱니다');
								$('button.append').css('display','none');
							}//if문
						},
					}); // ajax 함수
				} // if
			}); // 스크롤 이벤트
			$(document).on('click', 'button.modify', function(){
				var no = $(this).attr('id');
				var name = $('#name'+no).text();
				var tel = $('#tel'+no).text();
				var addr = $('#addr'+no).text();
				//open('${conPath}/friendModifyView.do?no='+no+'&name='+name+'&tel='+tel+'&addr='+addr, '','width=800,height=50,left=500, top=200');
				$.ajax({
					url : '${conPath}/friendModifyViewAjax.do',
					type : 'get',
					dataType : 'html',
					data : {'no':no, 'name':name, 'tel':tel, 'addr':addr},
					success : function(data){
						$('.m'+no).html(data);
					}
				});
			});// 수정버튼
		});
	</script>
</head>
<body>
	<h1>aJax로 수정</h1>
	<table>
		<tr><th>번호</th><th>이름</th><th>전화</th><th>주소</th></tr>
	</table>
	<c:forEach var="dto" items="${friendList }">
		<div class="m${dto.no }">
			<table>
				<tr>
					<td>${dto.no }</td>
					<td id="name${dto.no }">${dto.name }</td>
					<td id="tel${dto.no }">${dto.tel }</td>
					<td id="addr${dto.no }">${dto.addr }</td>
					<td><button class="modify" id="${dto.no }" id="${dto.no }">수정</button></td>
				</tr>
			</table>
		</div>
	</c:forEach>
	<div id="appendDiv"></div>
	<button class="append">더보기 <img src="${conPath }/img/down_arrow.png"></button>
</body>
</html>