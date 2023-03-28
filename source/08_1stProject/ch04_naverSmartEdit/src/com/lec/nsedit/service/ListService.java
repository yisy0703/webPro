package com.lec.nsedit.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.nsedit.dao.BDao;
import com.lec.nsedit.dto.BDto;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao bdao = new BDao();
		ArrayList<BDto> list = bdao.list();
		request.setAttribute("bList", list);
	}

}
