<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet">
	<style>p{text-align: center;}</style>
</head>
<%
	String searchName = request.getParameter("searchName");
	if(searchName==null){
		searchName = "";
	}
%>
<body>
	<form action="">
		<p>사원명 <input type="text" name="searchName" value="<%=searchName.toUpperCase()%>">
				<input type="submit" value="검색">
		</p>
	</form>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String uid    = "scott";
	String upw    = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet  rs = null;
	String sql = "SELECT E.*, DNAME, LOC FROM EMP E, DEPT D WHERE D.DEPTNO=E.DEPTNO and ENAME LIKE '%'||UPPER(?)||'%'";
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,searchName);
		rs = pstmt.executeQuery();
		out.println("<table><tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th>"
						+"<th>입사일</th><th>급여</th><th>부서번호</th><th>부서명</th></tr>");
		if(rs.next()){
			do{
				int empno = rs.getInt("empno");
				String ename = rs.getString("ENAME");
				String job = rs.getString("job");
				int mgr = rs.getInt("mgr");
				Date hiredate = rs.getDate("hiredate");
				int sal = rs.getInt("sal");
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				out.println("<tr><td>"+empno+"</td><td>"+ename+"</td><td>"+job+"</td><td>"
						+mgr+"</td><td>"+hiredate+"</td><td>"+sal+"</td><td>"+deptno+"</td><td>"
						+dname+"</td></tr>");
			}while(rs.next());
		}else{
			out.print("<tr><td colspan='8'>해당 사원이 없습니다</td><tr>");
		}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
%>

</body>
</html>