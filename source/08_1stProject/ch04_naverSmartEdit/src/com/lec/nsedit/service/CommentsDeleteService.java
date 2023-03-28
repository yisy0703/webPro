package com.lec.nsedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.nsedit.dao.CommentsDao;

public class CommentsDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentsDao cDao = new CommentsDao();
		int deleteResult = cDao.commentDelete(cno);
		
		if(deleteResult == CommentsDao.SUCCESS) {
			request.setAttribute("result", "댓글 삭제 성공");
		}else {
			request.setAttribute("result", "댓글 삭제 실패");
		}
	}

}
