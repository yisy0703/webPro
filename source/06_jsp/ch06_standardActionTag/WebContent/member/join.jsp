<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<%=conPath %>/css/join.css' rel='stylesheet'>
	<script>
		window.onload = function(){
			document.querySelector('form').onsubmit = function(){
				var pw = document.getElementById('pw');
				var pwChk = document.getElementById('pwChk');
				var patternMail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
				var email = document.getElementById('email');
				var mailSend = document.querySelector('select[name="mailSend"]');
				var mailOption = mailSend.querySelectorAll('option');
				if(pw.value != pwChk.value){
					alert('비밀번호를 확인하세요');
					pw.value = '';
					pwChk.value = '';
					pw.focus();
					return false;
				}else	if(!email.value.match(patternMail)){
		      alert('메일 형식을 확인하세요');
		      email.focus();
		      return false;
		    }/* else if(!mailOption[0].selected && !mailOption[1].selected 
					&& !mailOption[2].selected && !mailOption[3].selected ){
					alert('메일수신을 한가지 이상 선택해 주세요');
					return false;
				} */
				/* 바로 위의 if문을 아래로 변경 가능() 
				var mailOptionCnt = 0;
				for(var i=0 ; i<mailOption.length ; i++){
					mailOptionCnt += mailOption[i].selected;
				}
				if(!mailOptionCnt){
					alert('메일수신을 한가지 이상 선택해 주세요');
					return false;
				} */
			};
		};
	</script>
</head>
<body>
	<div id="joinForm_wrap">
		<div id="join_title">회원가입</div>
		<form action="joinPro.jsp" method="post">
			<input type="hidden" name="hiddenParam" value="xx">
			<table>
				<tr>
					<th><label for="name">이름</label></th>
					<td><input type="text" name="name" id="name" class="name" required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id" class="id" required="required"></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" name="pw" id="pw" class="pw" required="required"></td>
				</tr>
				<tr>
					<th><label for="pwChk">비밀번호확인</label></th>
					<td><input type="password" name="pwChk" id="pwChk" class="pwChk"></td>
				</tr>
				<tr>
					<th><label for="birth">생년월일</label></th>
					<td><input type="date" name="birth" id="birth" class="birth"></td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" value="독서" id="readind"><label for="readind">독서</label>
						<input type="checkbox" name="hobby" value="요리" id="cooking"><label for="cooking">요리</label>
						<input type="checkbox" name="hobby" value="운동" id="exercise"><label for="exercise">운동</label>
						<input type="checkbox" name="hobby" value="취침" id="sleep"><label for="sleep">취침</label>
					</td>
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
					<td><input type="text" name="email" id="email" class="email"></td>
				</tr>
				<tr>
					<th>메일수신</th>
					<td>
						<select name="mailSend" multiple="multiple" class="mailSend">
							<option>광고</option>
							<option>배송</option>
							<option>공지</option>
							<option>댓글</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="뒤로가기" class="joinBtn_style" 
											onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../member/footer.jsp"/>
	<%-- <%@include file="footer.jsp" %><!-- jsp 소스가 include --> --%>
</body>
</html>










