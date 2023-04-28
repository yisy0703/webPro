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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		var pageNum;
		$(document).ready(function(){
			var pageCnt = Number('${paging.pageCnt}');
			var total = Number('${paging.total}');
			if(total <= '${paging.pageSize}'){ // total갯수가 pageSize이하면 더보기 버튼 안 나옴 
				alert('total갯수가 pageSize이하면 더보기 버튼 안 나옴');
				$('#appendButton').css('display','none');
				$('#theEnd').css('display','block');
			}
			$('#appendButton').click(function(){
				pageNum = Number($('.pageNum').last().val());
				if(isNaN(pageNum)){
					pageNum = 1; // 처음 더보기를 누를 경우 pageNum을 1로
				}
				$.ajax({
					url : '${conPath}/memo/append.do',
					type : 'get',
					dataType : 'html',
					data : 'pageNum='+(pageNum+1),
					success : function(data){
						$('#appendSpace').append(data);
						pageNum = Number($('.pageNum').last().val());
						if(pageCnt <= pageNum){
							$('#appendButton').css('display','none');//마지막 페이지까지 더보기로 뿌려서 더보기 버튼 안 나옴
							$('#theEnd').css('display','block');
						}
					}
				}); // $.ajax()함수
			});// 더보기 button 이벤트 처리
			$(window).scroll(function(){
				if($(window).scrollTop() == $(document).height() - $(window).height()){ // 끝까지 스크롤을 내리면 더보기 효과 낸다
					$('#appendButton').trigger('click'); // 윗부분을 그대로 넣어도 되나, 강제이벤트 발생시킴				
				}
			});
			$('#insertButton').click(function(){
				var id = $('[name=id]').val();
				var content = $('[name=content]').val();
				alert(id + ' / ' +content);
				$.ajax({
					url : '${conPath}/memo/insert.do',
					type : 'get',
					dataType : 'html',
					data : 'id='+id+'&content='+content,
					success : function(data){
						$('#insertMemo').html(data+$('#insertMemo').html());
						$('[name=id]').val('');
						$('[name=content]').val('');
					}
				});
			});//insertButton이벤트
		});
	</script>
</head>
<body>
	<%-- <c:if test="${not empty insertResult }">
		<script>alert('${insertResult}');</script>
	</c:if> --%>
	<h2>리스트 입니다. 더보기를 누르던지 스크롤을 내리던지 하면 추가 됨</h2>
	<%-- <form action="${conPath }/memoInsert.do"> ajax로 안하고 form으로 할 수도 있음--%>
	<table>
		<tr><th>아이디</th><th>메모내용</th><th>글쓴시점</th><th>ip</th></tr>
		<tr>
			<td><input type="text" name="id" required="required" size="3"></td>
			<td colspan="2">
				<input type="text" name="content" required="required" size="55">
			</td>
			<td><input type="button" value="메모작성" id="insertButton"></td>
		</tr>
	</table>
	<table id="insertMemo"><tr></tr></table>
	<table>
			<c:if test="${empty noMore }">
				<c:forEach items="${memoList }" var="memo">
					<tr>
						<td>${memo.id }</td>
						<td>${memo.content }</td>
						<td>${memo.rdate }</td>
						<td>${memo.ip }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty noMore }">
				<tr><td colspan="4"><b>${noMore }</b></td></tr>
			</c:if>
		</table>
		<div id="appendSpace"></div>
		<!-- </form> -->
		<div class="paging">
			<button id="appendButton">더보기<img src="${conPath }/img/down_arrow.png"></button>
			<div id="theEnd" style="display: none; font-weight: bold; color : red; margin: 10px;">~ ~ ~ THE END ~ ~ ~</div>
		</div>
</body>
</html>