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
	<% 
		// 프로세스와 뷰를 분리
		int su = Integer.parseInt(request.getParameter("su"));
		int sum = 0; // 누적변수
		for(int i=1 ; i<=su ; i++){
			sum += i;
		}
		request.setAttribute("sum", sum);
	%>
	<jsp:forward page="ex2_suView.jsp"/>
	<%-- <h2>1부터 <%=su %>까지 누적합은 <%=sum %>입니다</h2> --%>
</body>
</html>
















