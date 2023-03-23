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
		tr{height: 50px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		var pageNum;
		$(document).ready(function(){
			var pageCnt = Number('${pageCnt}');
			var totCnt = Number('${totCnt}');
			if(totCnt<=5){
				alert('PAGESIZE인 5이하 갯수만 있으면 더보기 버튼 안 나옴');
				$('button').css('display','none');
			}
			pageNum = Number($('.pageNum').last().val());
			if(pageCnt == pageNum){
				$('button').css('display','none');
			}
			$('button').click(function(){
				pageNum = Number($('.pageNum').last().val());
				if(isNaN(pageNum)){
					pageNum=1;
				}
				
				$.ajax({
					url : '${conPath}/append.do',
					type : 'get',
					dataType : 'html',
					data : {"pageNum":(pageNum+1)},
					success : function(data){
						$('#appendDiv').append(data);
						pageNum = Number($('.pageNum').last().val());
						if(pageCnt <= pageNum){
							alert('마지막 페이지까지 뿌려서 더보기 버튼을 없애');
							$('button').css('display','none');
						}
					}
				});//ajax
			});// 더보기 버튼
			// 무한 스크롤 - 끝가지 가면 스크롤 이벤트 제거
			$(window).scroll(function(){
				pageNum = Number($('.pageNum').last().val());
				if(isNaN(pageNum)){
					pageNum=1;
				}
				//$(document).scroll() // 스크롤이 변경될때마다 이벤트를 발생시킴
				//$(document).height() // 현재페이지(문서)의 높이
				//$(window).height() // 윈도우의 크기
				//$(window).scrollTop() // 브라우저의 스크롤 위치값
				if($(window).scrollTop()+30>= $(document).height()-$(window).height()){ // 30은 현재 스크롤 위치값에 약간의 보정치를 추가한 부분. 이를 사용하여 사용자가 반드시 최하단이 아니라 하단보다 조금 위에 위치했더라도 미리 새로운 콘텐츠가 추가될 수 있다.
					$.ajax({
						url : '${conPath}/append.do',
						type : 'get',
						dataType : 'html',
						data : "pageNum="+(pageNum+1),
						success : function(data){
							$('#appendDiv').append(data);
							pageNum = Number($('.pageNum').last().val());
							if(pageCnt <= pageNum){
								alert('마지막 페이지까지 뿌려서 스크롤 이벤트도 없애');
								$(window).off('scroll');
							}
						}
					});//ajax
				}//if
			});
		});
	</script>
</head>
<body>
	<table>
		<tr><th>번호</th><th>이름</th><th>전화</th><th>주소</th></tr>
			<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.no }</td>
						<td>${dto.name }</td>
						<td>${dto.tel }</td>
						<td>${dto.addr }</td>
					</tr>
			</c:forEach>
	</table>
	
	<div id="appendDiv"></div>
	<button>더보기 <img src="down_arrow.png"> </button>
</body>
</html>