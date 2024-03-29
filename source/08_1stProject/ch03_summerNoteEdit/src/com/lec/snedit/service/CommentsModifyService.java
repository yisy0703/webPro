package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.CommentsDao;
import com.lec.snedit.dto.CommentsDto;

public class CommentsModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String ccontent = request.getParameter("ccontent");
		String cip = request.getRemoteAddr();
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentsDao cDao = new CommentsDao();
		CommentsDto comment = new CommentsDto(cno, 0, ccontent, cip, null);
		request.setAttribute("commentModifyResult", cDao.commentModify(comment));
	}

}
