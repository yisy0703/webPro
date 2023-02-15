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
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
	<style>p {text-align: center;}</style>
</head>
<body>
	<%!
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String uid    = "scott";
		String upw    = "tiger";
	%>
	<form action="ex3_empOut.jsp">
		<p>
			부서번호 
			<select name="deptno">
				<option value="0"></option>
				<%
					Connection        conn = null;
					PreparedStatement pstmt = null;
					ResultSet         rs    = null;
					String sql = "SELECT * FROM DEPT";
					try{
						Class.forName(driver); // 1단계
						conn  = DriverManager.getConnection(url, uid, upw); // 2단계
						pstmt = conn.prepareStatement(sql); // 3단계
						rs    = pstmt.executeQuery(); // 4+5 단계
						while(rs.next()){ // 6단계
							// <option value="10">10 - ACCOUNTING - NEW YORK</option>
							int deptno = rs.getInt("deptno");
							String dname = rs.getString("dname");
							String loc   = rs.getString("loc");
							out.println("<option value='"+deptno+"'>"+
															deptno + " - " + dname + " - " + loc+
													"</option>");
						}
					}catch(Exception e){
						System.out.println(e.getMessage());
					}finally{ // 7단계
						if(rs   !=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn !=null) conn.close();
					}
				%>
			</select>
			<input type="submit" value="검색">
		</p>
	</form>
</body>
</html>














