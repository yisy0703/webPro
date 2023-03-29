package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.BDao;
import com.lec.snedit.dao.CommentsDao;
import com.lec.snedit.dto.BDto;

public class ContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bdao = new BDao();
		int bno;
		if(request.getParameter("bno")!=null) { 
			bno = Integer.parseInt(request.getParameter("bno"));
		}else {
			bno = (int) request.getAttribute("bno"); // 글 수정 후 상세보기 페이지로 올 때 필요
		}
		BDto dto = bdao.getDto(bno);
		request.setAttribute("dto", dto);
		CommentsDao cdao = new CommentsDao();
		request.setAttribute("comments", cdao.commentsList(bno));
	}
}
