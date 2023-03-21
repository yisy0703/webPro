package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.BDao;
import com.lec.snedit.dao.ReplyDao;
import com.lec.snedit.dto.BDto;

public class ContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bdao = new BDao();
		int bno = Integer.parseInt(request.getParameter("bno"));
		BDto dto = bdao.getDto(bno);
		request.setAttribute("dto", dto);
		ReplyDao rdao = new ReplyDao();
		request.setAttribute("replys", rdao.replyList(bno));
	}

}
