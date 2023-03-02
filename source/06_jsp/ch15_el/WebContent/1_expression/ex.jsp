<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>표현식  태그 이용</h1>
	<p>산술연산자 : 10+1 = <%=10+1 %></p>
	<p>산술연산자 : 10/0.0 = <%=10/0.0 %></p><!-- 0으로 나누면 에러. 0.0으로 나누면 가능 -->
	<p>관계연산자 : 1 > 2 = <%=1>2 %></p>
	<p>관계연산자 : 1==2 = <%=1==2 %><p>
	<p>관계연산자 : 1!=2 = <%=1!=2 %></p>
	<p>조건연산자 : <%=(1>2)? "1이 2보다 큽니다" : "1이 2보다 크지 않습니다" %></p>
	<p>논리연산자 : (1>2) || (1&lt;2) = <%=(1>2) || (1<2) %></p>
	<p>로그인 여부 : <%=session.getAttribute("customer")==null? "로그인 안함":"로그인 함" %></p>
	<p>로그인 여부 : <%=session.getAttribute("customer")!=null? "로그인 함": "로그인 안 함" %></p>
	<p>pageNum 파라미터 여부 : <%=request.getParameter("pageNum")==null? "pageNum안 옴":"pageNum옴" %>
	<p>su파라미터 값 : <%=request.getParameter("su") %></p>
	<%-- <p>su파라미터 값 : <%=request.getParameter("su").toUpperCase() %></p> --%>
	
	<h1>EL 표기법(표현식 안에 쓸 수 있는 연산자는 다 사용 가능)</h1>
	<p>산술연산자 : 10+1 = ${10+1 } </p>
	<p>산술연산자 : 10/0 = ${10/0.0 }</p>
	<p>관계연산자 : 1 > 2 = ${1>2 }</p>
	<p>관계연산자 : 1==2 = ${1 eq 2 }</p>
	<p>관계연산자 : 1!=2 = ${1 != 2 }</p>
	<p>조건연산자 : ${(1>2)? "1이 2보다 큽니다":"1이 2보다 크지 않습니다" }</p>
	<p>논리연산자 : (1>2) || (1&lt;2) = ${(1>2) || (1<2) }</p>
	<p>로그인 여부 : ${customer eq null ? "로그인 안 함" :"로그인 함"}</p>
	<p>로그인 여부 : ${empty customer ? "로그인 안 함" :"로그인 함" }</p>
	<p>로그인 여부 : ${not empty customer ? "로그인 함":"로그인 안 함" }</p>
	<p>파라미터 여부 : ${empty param.pageNum ? "pageNum 안 옴":"pageNum 옴"}</p>
	<p>su파라미터 값 : ${param.su }</p>
	<p>su파라미터의 대문자 변경 : ${param.su.toUpperCase() }</p>
</body>
</html>
















