package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.CommentsDao;
import com.lec.snedit.dto.CommentsDto;

public class CommentsModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String rcontent = request.getParameter("rcontent");
		String rip = request.getRemoteAddr();
		int rno = Integer.parseInt(request.getParameter("rno"));
		CommentsDao dao = new CommentsDao();
		CommentsDto dto = new CommentsDto(rno, 0, rcontent, rip, null);
		request.setAttribute("replyModifyResult", dao.replyModify(dto));
	}

}
