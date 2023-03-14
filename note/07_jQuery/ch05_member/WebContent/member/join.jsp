<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='${conPath }/css/join.css' rel='stylesheet'>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#id').keyup(function(){
				var id = $('#id').val();
				$.ajax({
					url : '${conPath}/idConfirm.do',
					type : 'get',
					dataType : 'html',
					data : "id="+id,
					success : function(data){
						$('#idConfirmResult').html(data);
					}
				});//ajax
			});
			$('#pwChk').keyup(function(){
				var pw = $('#pw').val();
				var pwChk = $(this).val();
				if(pw == pwChk){
					$('#pwChkResult').html('비밀번호 일치');
				}else{
					$('#pwChkResult').html('비밀번호 불일치');
				}
			});
			$('#email').keyup(function(){
				var email = $('#email').val();
				$.ajax({
					url : '${conPath}/emailConfirm.do',
					type : 'get',
					dataType : 'html',
					data : "email="+email,
					success : function(data){
						$('#emailConfirmResult').html(data);
					}
				});//ajax
			});
			$('form').submit(function(){
				var idConfirmResult = $('#idConfirmResult').text().trim();
				var pwChkResult = $('#pwChkResult').text();
				var emailConfirmResult = $('#emailConfirmResult').text().trim();
				if(idConfirmResult!='사용가능한 ID입니다'){
					alert('사용가능한 ID인지 확인요망');
					return false;
				}else if(pwChkResult!='비밀번호 일치'){
					alert('비밀번호가 일치하지 않아요');
					$('#pw').focus();
					return false;
				}else if(emailConfirmResult!='사용가능한 메일주소입니다'){
					alert('중복된 메일은 가입이 불가합니다');
					return false;
				}
			});
		});
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $( "#datepicker" ).datepicker({
	    	dateFormat : 'yy/mm/dd',
	    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	showMonthAfterYear : true,
	    	yearSuffix : '년', // "2020년 3월"
	    	showOtherMonths : true,
	    	dayNamesMin:['일','월','화','수','목','금','토']
	    });
  } );
  </script>
</head>
<body>
	<div id="joinForm_wrap">
		<form action="${conPath }/join.do" method="post">
			<div id="join_title">회원가입</div>
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id" class="id" required="required">
							<div id="idConfirmResult"> &nbsp; &nbsp; &nbsp; </div></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" name="pw" id="pw" class="pw" required="required"></td>
				</tr>
				<tr>
					<th><label for="pwChk">비밀번호확인</label></th>
					<td><input type="password" name="pwChk" id="pwChk" class="pwChk">
							<div id="pwChkResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td><input type="text" name="name" id="name" class="name"></td>
				</tr>
				<tr>
					<th><label for="birth">생년월일</label></th>
					<td><input type="text" name="birth" id="datepicker" class="birth"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="m" checked="checked" id="m"><label for="m">남자</label>
						<input type="radio" name="gender" value="f" id="f"><label for="f">여자</label>
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="email" name="email" id="email" class="email" required="required">
							<div id="emailConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
					</td>
				</tr>
				<tr>
					<th><label for="tel">전화번호</label></th>
					<td>
						<input type="tel" name="tel" id="tel" class="tel">
					</td>
				</tr>
								<tr>
					<th><label for="address">주소</label></th>
					<td>
						<input type="text" name="address" id="address" class="address">
					</td>
				</tr>
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="로그인" class = "joinBtn_style"
									onclick="location.href='${conPath}/loginView.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>