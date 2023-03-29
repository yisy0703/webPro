package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.CommentsDao;
import com.lec.snedit.dto.CommentsDto;

public class CommentsWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String ccontent = request.getParameter("ccontent");
		String cip = request.getRemoteAddr();
		CommentsDao cDao = new CommentsDao();
		CommentsDto comment = new CommentsDto(0, bno, ccontent, cip, null);
		request.setAttribute("commentWriteResult", cDao.commentWrite(comment));
	}

}
