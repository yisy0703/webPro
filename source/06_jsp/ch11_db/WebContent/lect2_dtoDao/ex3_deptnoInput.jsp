<%@page import="com.lec.dto.DeptDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.DeptDao"%>
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
	<form action="ex3_empOut.jsp">
		<p>
			부서번호
			<select name="deptno">
				<option value="0"></option>
				<%
					DeptDao dDao = DeptDao.getInstance();
					ArrayList<DeptDto> deptList = dDao.deptList();
					for(DeptDto dept : deptList){
						int deptno   = dept.getDeptno();
						String dname = dept.getDname();
						String loc   = dept.getLoc();
						out.println("<option value='" + deptno + "'>" +
												deptno + " - " + dname + " - " + loc + 
												"</option>");
					}
				%>
			</select>
			<input type="submit" value="검색">
		</p>
	</form>
</body>
</html>