<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
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
		String path = request.getRealPath("fileUpFolder"); // 첨부할 파일이 저장될 서버(WAS) 폴더
		out.print(path);
		int maxSize = 1024*1024*10; // 업로드 최대 용량 (10MB)
		String filename = "";
		String originalFilename = "";
		try{
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
																	new DefaultFileRenamePolicy());
			// new DefaultFileRenamePolicy() : 같은 이름의 파일이 있을 경우 : 1.jpg -> 11.jpg -> 12.jpg
			Enumeration<String> paramNames = mRequest.getFileNames(); // 파일 첨부한 파라미터들
			while(paramNames.hasMoreElements()){
				String param = paramNames.nextElement(); // param = "file"
				filename = mRequest.getFilesystemName(param); // 파라미터로 올라온 파일 이름
				originalFilename = mRequest.getOriginalFileName(param); // 파라미터에 첨부한 오리지널 파일이름
				System.out.println("파라미터 이름 : " + param + 
													"/서버에 저장된 파일 이름 : " + filename +
													"/사용자가 첨부한 오리지널 이름 :" + originalFilename);
			}
			
		}catch(IOException e){
			System.out.println(e.getMessage());
		}		
		// 서버에 업로드 한 후 소스폴더로 file copy
		InputStream is = null;
		OutputStream os = null;
		try{
			File serverFile = new File(path + "/" + filename);
			//if(filename != null){
			if(serverFile.exists()){
				is = new FileInputStream(serverFile); // 서버에 업로드 된 파일
				os = new FileOutputStream("D:/webPro/source/06_jsp/ch14_fileUp/WebContent/fileUpFolder/"+filename); // 소스폴더로 복사될 파일
				byte[] bs = new byte[(int)serverFile.length()];
				while(true){
					int nReadCnt = is.read(bs);
					if(nReadCnt == -1) break;
					os.write(bs, 0, nReadCnt);
				}
				System.out.println("서버에 업로드한 파일을 소스폴더로 복사 완료");
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			try{
				if(os!=null) os.close();
				if(is!=null) is.close();
			}catch(IOException e){
				System.out.println(e.getMessage());
			}
		}
		if(filename!=null){
	%>
			<h3>첨부한 오리지널 파일 이름 <%=originalFilename %></h3>
			<h3>서버에 저장된 파일 이름 <%=filename %></h3>
			<img src="<%=conPath %>/fileUpFolder/<%=filename %>" alt="첨부안함">
	<%}else{
			out.println("<h2>첨부 안 함 : filename="+filename + ", 오리지널=" + originalFilename+"</h2>");
		}
	%>	
</body>
</html>
















