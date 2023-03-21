package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.ReplyDao;

public class ReplyModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		ReplyDao dao = new ReplyDao();
		request.setAttribute("dto", dao.getDto(rno));

	}

}
