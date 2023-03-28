package com.lec.map.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.map.dao.MemberDao;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao memberDao = new MemberDao();
		request.setAttribute("memberList", memberDao.memberList());
	}

}
