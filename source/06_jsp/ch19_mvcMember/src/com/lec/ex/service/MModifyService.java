package com.lec.ex.service;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.ex.dao.MemberDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
public class MModifyService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int    maxSize = 1024 * 1024; // 최대 업로드 사이즈 1M
		String mphoto = ""; // 첨부 파일 이름이 저장될 변수
		int result = MemberDao.FAIL;
		try {
			// mRequest 객체 생성(서버에 업로드된 파일 저장) 후, 파일 이름 받아오기
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, 
										"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			//while(params.hasMoreElements()) {
				String param = params.nextElement(); // param이 "mphoto"
				mphoto = mRequest.getFilesystemName(param);
			//}
			// 파라미터 받아 DB에 수정 적용
			String dbMpw = mRequest.getParameter("dbMpw");
			String dbMphoto = mRequest.getParameter("dbMphoto");
			String mid      = mRequest.getParameter("mid");
			String oldMpw   = mRequest.getParameter("oldMpw");
			if(!oldMpw.equals(dbMpw)) {
				request.setAttribute("modifyResult", "현비밀번호를 확인하세요");
				return;
			}
			String mpw = mRequest.getParameter("mpw");
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		//서버에 저장된 파일을 소스 폴더로 복사(파일명이 NOIMG.JPG거나 result가 FAIL이 아닐 경우) 
	}
}







