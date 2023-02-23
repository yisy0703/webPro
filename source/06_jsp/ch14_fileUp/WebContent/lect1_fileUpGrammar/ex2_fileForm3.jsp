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
	<form action="ex2_filePro.jsp" method="post" enctype="multipart/form-data">
		<p> 이름    <input type="text" name="name"></p>
		<p> 파일0 <input type="file" name="file0"></p>
		<p> 파일1 <input type="file" name="file1"></p>
		<p> 파일2 <input type="file" name="file2"></p>
		<p><input type="submit" value="업로드" class="btn"></p>
	</form>
</body>
</html>








