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
		input[type="text"], input[type="password"]{width:95%;}
		#sample6_postcode {width:50%;}
		input[type="button"], input[type="submit"]{width:42%;}
		td{width:320px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
  	$(function(){
  		$('input[name="id"]').keyup(function(){
  			var id = $(this).val();
  			if(id.length<2){
  				$('#idConfirmResult').text('아이디는 2글자 이상');
  			}else{
  				$.ajax({
  					url : '${conPath}/idConfirm.do',
  					type : 'get',
  					//data : {'id':id},
  					data : 'id='+id,
  					dataType : 'html',
  					success : function(data){
  						$('#idConfirmResult').html(data);
  					},
  				});// ajax함수
  			}//if
  		});// keyup event
  	});
  </script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
									/*
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
									*/
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
</head>
<body>
	<form action="${conPath }/join.do" method="post">
		<table>
			<caption>회원가입</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" required="required" autofocus="autofocus" style="ime-mode:disabled;"><!-- 영문 -->
					<div id="idConfirmResult"> &nbsp; </div>
				</td> 
			</tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw" required="required"></td></tr>
			<tr><th>이름</th>	<td><input type="text" name="name" required="required"  style="ime-mode:active;"></td></tr><!-- 디폴트 한글 -->
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="address"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
					<!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="회원가입" class="btn">
					<input type="button" value="로그인" class="btn" onclick="location.href='${conPath}/loginView.do'">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>