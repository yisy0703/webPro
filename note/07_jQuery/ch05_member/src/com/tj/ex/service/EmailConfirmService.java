package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;

public class EmailConfirmService implements MService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.emailConfirm(email);
		if(result==MemberDao.EXISTENT) {
			request.setAttribute("emailConfirmResult", "중복된 메일주소입니다");
		}else {
			request.setAttribute("emailConfirmResult", "사용가능한 메일주소입니다");
		}
	}
}