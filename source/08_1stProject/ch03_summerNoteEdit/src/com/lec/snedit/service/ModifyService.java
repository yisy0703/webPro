package com.lec.snedit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.dao.BDao;

public class ModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BDao dao = new BDao();
		request.setAttribute("dto", dao.getDto(bno));
	}

}
