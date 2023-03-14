package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;

public class LoginService implements MService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginCheck(id, pw);
		if(result == MemberDao.LOGIN_SUCCESS) {
			MemberDto member = mDao.getMember(id);
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
		}else {
			request.setAttribute("errorMsg", "아이디와 비번을 확인하세요");
		}
	}
}
