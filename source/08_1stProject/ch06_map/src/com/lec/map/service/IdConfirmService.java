package com.lec.map.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.map.dao.MemberDao;

public class IdConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		int result = dao.idConfirm(id);
		if(result == MemberDao.EXISTENT) {
			request.setAttribute("idConfirmResult", "<b>중복된 ID입니다</b>");
		}else {
			request.setAttribute("idConfirmResult", "사용가능한 ID입니다");
		}
	}

}
