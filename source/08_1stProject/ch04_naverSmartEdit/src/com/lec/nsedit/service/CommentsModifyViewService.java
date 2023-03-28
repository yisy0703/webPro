package com.lec.nsedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.nsedit.dao.CommentsDao;

public class CommentsModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentsDao dao = new CommentsDao();
		request.setAttribute("dto", dao.getComment(cno));
	}

}
