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
</head>
<body>
	<%!
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String uid    = "scott";
		String upw    = "tiger";
	%>
	<table>
		<tr><th>사번</th><th>이름</th><th>직책</th><th>부서번호</th></tr>
		<%
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM EMP WHERE DEPTNO LIKE '%'||?";
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			try{
				Class.forName(driver);
				conn = DriverManager.getConnection(url, uid, upw);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, deptno);
				rs = pstmt.executeQuery();
				if(rs.next()){
					// 해당 부서번호의 사원이 있는 경우
					do{
						int    empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						String job   = rs.getString("job");
						deptno   = rs.getInt("deptno");
						out.println("<tr><td>" + empno + "</td>");
						out.println("    <td>" + ename + "</td>");
						out.println("    <td>" + job + "</td>");
						out.println("    <td>" + deptno + "</td></tr>");
					}while(rs.next());
				}else{
					// 해당 부서번호의 사원이 없는 경우
					out.println("<tr><td colspan='4'>해당 부서 번호의 사원이 없습니다</td><tr>");
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			}
		%>
	</table>
</body>
</html>













