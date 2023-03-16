package com.lec.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 삭제하고자 하는 글만 삭제
		int fid = Integer.parseInt(request.getParameter("fid"));
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.deleteBoard(fid);
		if(result == BoardDao.SUCCESS) {
			request.setAttribute("boaredResult", "글 삭제 성공");
		}else {
			request.setAttribute("boaredResult", "글삭제 실패");
		}
		// 삭제하고자 하는 글과 답변글 모두 삭제 추가할 예정
	}

}
