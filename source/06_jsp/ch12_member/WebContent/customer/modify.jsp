<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="java.sql.Date"%>
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
				var cpw = document.getElementById('cpw');
				var cpwChk = document.getElementById('cpwChk');
				var patternMail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
				var cemail = document.getElementById('cemail');
				if(cpw.value != cpwChk.value){
					alert('비밀번호를 확인하세요');
					cpw.value = '';
					cpwChk.value = '';
					cpw.focus();
					return false;
				}else	if(cemail.value && !cemail.value.match(patternMail)){
		      alert('메일 형식을 확인하세요');
		      cemail.focus();
		      return false;
		    }
			};
		};
	</script>
</head>
<body>
	<%! 
		String cid, cname, ctel, cemail, caddress, cgender; 
		Date cbirth; 
	%>
	<%
		CustomerDto customer = (CustomerDto)session.getAttribute("customer");
		if(customer==null){
			response.sendRedirect("login.jsp?method=modify");
		}else{
			cid = customer.getCid();
			cname = customer.getCname();
			ctel = customer.getCtel();
			cemail = customer.getCemail();
			caddress = customer.getCaddress();
			cbirth = customer.getCbirth();
			cgender  = customer.getCgender();
		}
	%>
	<jsp:include page="../customer/header.jsp"/>
	<div id="joinForm_wrap">
		<div id="join_title">정보수정</div>
		<form action="<%=conPath %>/customer/modifyPro.jsp" method="post">
			<table>
				<tr>
					<th><label for="cid">아이디</label></th>
					<td><input type="text" name="cid" id="cid" value="<%=cid %>" required="required" readonly="readonly"></td>
				</tr>
				<tr>
					<th><label for="oldCpw">현비밀번호</label></th>
					<td><input type="password" name="oldCpw" id="oldCpw" required="required"></td>
				</tr>
				<tr>
					<th><label for="cpw">새비밀번호</label></th>
					<td><input type="password" name="cpw" id="cpw"></td>
				</tr>
				<tr>
					<th><label for="cpwChk">새비밀번호</label></th>
					<td><input type="password" name="cpwChk" id="cpwChk"></td>
				</tr>
				<tr>
					<th><label for="cname">이름</label></th>
					<td><input type="text" name="cname" id="cname" value="<%=cname %>" required="required"></td>
				</tr>
				<tr>
					<th><label for="ctel">전화</label></th>
					<td><input type="text" name="ctel" id="ctel" value='<%=ctel==null? "" : ctel%>'></td>
				</tr>
				<tr>
					<th><label for="cemail">이메일</label></th>
					<td><input type="text" name="cemail" id="cemail" value='<%=cemail==null? "" : cemail%>'></td>
				</tr>
				<tr>
					<th><label for="caddress">주소</label></th>
					<td><input type="text" name="caddress" id="caddress" value='<%=caddress==null? "" : caddress%>'></td>
				</tr>
				<tr>
					<th><label for="cbirth">생년월일</label></th>
					<td>
						<input type="date" name="tempCbirth" id="cbirth" value='<%=cbirth==null? "":cbirth.toString()%>'>
						<%-- <input type="date" name="tempCbirth" 
							value='<%=cbirth==null? "":cbirth.toString().substring(0,10)%>'> --%>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<%if("m".equals(cgender)){ %>
						<input type="radio" name="cgender" value="m" checked="checked">남
						<input type="radio" name="cgender" value="f">여
					<%}else if("f".equals(cgender)){ %>
						<input type="radio" name="cgender" value="m">남
						<input type="radio" name="cgender" value="f" checked="checked">여
					<%}else{ %>
						<input type="radio" name="cgender" value="m">남
						<input type="radio" name="cgender" value="f">여
					<%} %>
				</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="로그아웃" class="joinBtn_style" 
											onclick="location.href='<%=conPath%>/customer/logout.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../customer/footer.jsp"/>
</body>
</html>










