package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;

public class IdConfirmService implements MService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.idConfirm(id);
		if(result==MemberDao.EXISTENT) {
			request.setAttribute("idConfirmResult", "중복된 ID입니다");
		}else {
			request.setAttribute("idConfirmResult", "사용가능한 ID입니다");
		}
	}
}
