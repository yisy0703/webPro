package com.lec.nsedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.nsedit.dao.CommentsDao;
import com.lec.nsedit.dto.CommentsDto;

public class CommentsWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String ccontent = request.getParameter("ccontent");
		String cip = request.getRemoteAddr();
		CommentsDto comment = new CommentsDto(0, bno, ccontent, cip, null);
		CommentsDao cDao = new CommentsDao();
		int commentWriteResult = cDao.commentWrite(comment);
		if(commentWriteResult == CommentsDao.SUCCESS) {
			request.setAttribute("result", "댓글 쓰기 성공");
		}else {
			request.setAttribute("result", "댓글 쓰기 실패");
		}
	}

}
