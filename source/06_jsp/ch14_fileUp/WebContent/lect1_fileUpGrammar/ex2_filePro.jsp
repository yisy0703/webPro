<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		String path = request.getRealPath("fileUpFolder");
		// out.println(path);
		int maxSize = 1024*1024*5 ; // 최대 업로드 용량은 5MB
		String[] filenames = {"", "", ""};
		String[] oriFilenames = {"", "", ""};
		try{
			MultipartRequest multiRequest = new MultipartRequest(request, path, maxSize, 
													"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> paramNames = multiRequest.getFileNames(); // "file0" "file1" "file2"
			int idx = 0;
			while(paramNames.hasMoreElements()){
				String param = paramNames.nextElement(); // 파라미터이름
				filenames[idx] = multiRequest.getFilesystemName(param); // 해당 파라미터 이름으로 저장된 파일 이름
				oriFilenames[idx] = multiRequest.getOriginalFileName(param); // 파리미터이름으로 첨부한 오리지널 이름
				System.out.println(idx+"번째 파라미터 :" + param + 
												", 서버된 저장된 파일 이름 : " + filenames[idx] + 
												", 첨부한 오리지널 파일 이름 : " + oriFilenames[idx]);
				idx++;
			}
		}catch(IOException e){
			System.out.println(e.getMessage());
		}
	%>
</body>
</html>
















