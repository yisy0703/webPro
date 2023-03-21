package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.ReplyDao;
import com.lec.snedit.dto.ReplyDto;

public class ReplyModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String rcontent = request.getParameter("rcontent");
		String rip = request.getRemoteAddr();
		int rno = Integer.parseInt(request.getParameter("rno"));
		ReplyDao dao = new ReplyDao();
		ReplyDto dto = new ReplyDto(rno, 0, rcontent, rip, null);
		request.setAttribute("replyModifyResult", dao.replyModify(dto));
	}

}
