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
		b { color: blue;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			const list = ${list}; // 객체 ArrayList는 가능
			// const list = JSON.parse(`${list}`); // JSON.parse을 쓰려면 toString에 \"이용
			let output = '<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>나이</th></tr>';
			$(list).each(function(idx, item){
				output += '<tr><td>' + item.id + '</td><td>' + item.pw + '</td><td>' + item.name + '</td><td>' + item.age + '</td></tr>';
			});
			$('table.listTable').append(output);
			
			const test = '${test}'; // String ArrayList는 ''로 감쌈
			let temp = test.substring(1, test.length-1);
			const arr = temp.split(', ');
			$(arr).each(function(idx, item){
				$('p.testP').append('<b>' + item + '</b> ~ ');
			});
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<h3>list(DTO ArrayList) : ${list }</h3>
	<table class="listTable">
		<caption>&#36;{ list }를 테이블로 출력</caption>
	</table>
	<h3>test(String ArrayList) : ${test }</h3>
	<p class="testP"></p>
	<hr>
	<form action="${conPath }/member/join">
		<table>
			<caption>개인 정보 입력</caption>
			<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pw"></td></tr>
			<tr><th>이름</th><td><input type="text" name="name"></td></tr>
			<tr><th>나이</th><td><input type="text" name="age"></td></tr>
			<tr><td colspan="2"><input type="submit" value="join"></td></tr>
		</table>
	</form>
</body>
</html>