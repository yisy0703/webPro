package com.lec.nsedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.nsedit.dao.CommentsDao;
import com.lec.nsedit.dto.CommentsDto;

public class CommentsModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		String ccontent = request.getParameter("ccontent");
		String cip = request.getRemoteAddr();
		CommentsDao dao = new CommentsDao();
		CommentsDto comment = new CommentsDto(cno, 0, ccontent, cip, null);
		int modifyResult = dao.commentModify(comment);
		if(modifyResult == CommentsDao.SUCCESS) {
			request.setAttribute("result", "댓글 수정 성공");
		}else {
			request.setAttribute("result", "댓글 수정 실패");
		}
	}

}
