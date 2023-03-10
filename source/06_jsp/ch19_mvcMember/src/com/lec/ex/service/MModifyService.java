package com.lec.ex.service;
import java.io.IOException;

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
		String mphoto = "";
		int result = MemberDao.FAIL;
		try {
			// mRequest 객체 생성(서버에 업로드된 파일 저장) 후, 파일 이름 받아오기
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, 
										"utf-8", new DefaultFileRenamePolicy());
			// 파라미터 받아 DB에 수정 적용
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}
