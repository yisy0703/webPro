package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.FriendDao;

public class ModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
		FriendDao dao = new FriendDao();
		request.setAttribute("modifyDto", dao.getFriend(no));
	}

}
