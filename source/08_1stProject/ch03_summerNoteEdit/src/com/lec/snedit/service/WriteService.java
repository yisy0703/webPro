package com.lec.snedit.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.BDao;
import com.lec.snedit.dto.BDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class WriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("img");
		int maxSize = 1024*1024*10;
		MultipartRequest mRequest = null;
		String bfile = "";
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			while (params.hasMoreElements()) {
				String param = (String) params.nextElement();
				bfile = mRequest.getFilesystemName(param);
				System.out.println("첨부파일 넘어온 파라미터 이름"+param+" / 첨부파일이름 : "+bfile);
			}
			String btitle = mRequest.getParameter("btitle");
			String bcontent = mRequest.getParameter("bcontent");
			BDto dto = new BDto(0, btitle, bcontent, bfile);
			BDao dao = new BDao();
			int result = dao.write(dto);
			if(result==1) {
				request.setAttribute("result", "글쓰기 성공");
			}else {
				request.setAttribute("result", "글쓰기 실패");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("result", "글쓰기 실패");
		}
		File serverFile = new File(path+"/"+bfile);
		if(serverFile.exists()) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/source/08_1stProject/ch03_summerNoteEdit/WebContent/img/"+bfile);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println("파일복사 오류 : "+e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

}
