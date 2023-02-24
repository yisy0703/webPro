<%@page import="java.util.Arrays"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
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
		String name = null;		
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
			name = multiRequest.getParameter("name");
			//
		}catch(IOException e){
			System.out.println(e.getMessage());
		}
		//
		// 파일 복사 (path -> 소스폴더)
		for(String file : filenames){
			if(file!=null){
				InputStream is = null;
				OutputStream os = null;
				try{
					File serverFile = new File(path + "/" + file);
					if(serverFile.exists()){ // file이 존재하면 복사
						is = new FileInputStream(serverFile);
						os = new FileOutputStream("D:/webPro/source/06_jsp/ch14_fileUp/WebContent/fileUpFolder/"+file);
						byte[] bs = new byte[(int)serverFile.length()];
						while(true){
							int readByte = is.read(bs);
							if(readByte == -1) break;
							os.write(bs, 0, readByte);
						}
						System.out.println(file + " 복사 성공");
					}
				}catch(IOException e){
					System.out.println(e.getMessage());
				}finally{
					try{
						if(os!=null) os.close();
						if(is!=null) is.close();
					}catch(IOException e){
						System.out.println(e.getMessage());
					}
				} // try-catch-finally
			}//if
		}//for
	%>
	<h3><%=Arrays.toString(filenames) %></h3>
	<h3><%=Arrays.toString(oriFilenames) %></h3>
	<h3>0번째 첨부</h3>
	<h3><%=path %>/<%=filenames[2] %></h3>
	<img src="<%=conPath %>/fileUpFolder/<%=filenames[2] %>" alt="0번째 첨부 안함">
	<h3>1번째 첨부</h3>
	<h3><%=path %>/<%=filenames[1] %></h3>
	<img src="<%=conPath %>/fileUpFolder/<%=filenames[1] %>" alt="1번째 첨부 안함">
	<h3>2번째 첨부</h3>
	<h3><%=path %>/<%=filenames[0] %></h3>
	<img src="<%=conPath %>/fileUpFolder/<%=filenames[0] %>" alt="2번째 첨부 안 함">
	<h3>이름 : <%=name %></h3>
</body>
</html>
















