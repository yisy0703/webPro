package com.lec.nsedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.nsedit.dao.BDao;
import com.lec.nsedit.dao.CommentsDao;
import com.lec.nsedit.dto.BDto;

public class ContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bdao = new BDao();
		int bno = Integer.parseInt(request.getParameter("bno"));
		BDto dto = bdao.getDto(bno);
		request.setAttribute("dto", dto);
		CommentsDao cdao = new CommentsDao();
		request.setAttribute("comments", cdao.commentsList(bno));
	}

}
