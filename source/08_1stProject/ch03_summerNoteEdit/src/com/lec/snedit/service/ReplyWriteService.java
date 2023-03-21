package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.ReplyDao;
import com.lec.snedit.dto.ReplyDto;

public class ReplyWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String rcontent = request.getParameter("rcontent");
		String rip = request.getRemoteAddr();
		ReplyDao dao = new ReplyDao();
		ReplyDto dto = new ReplyDto(0, bno, rcontent, rip, null);
		request.setAttribute("replyWriteResult", dao.write(dto));
	}

}
