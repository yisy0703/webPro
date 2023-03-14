package com.tj.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;
public class JoinService implements MService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id     = request.getParameter("id");
		String pw     = request.getParameter("pw");
		String name   = request.getParameter("name");
		String birth  = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String email  = request.getParameter("email");
		String tel    = request.getParameter("tel");
		String address= request.getParameter("address");
		MemberDto member = new MemberDto(id, pw, name, birth, gender, email, tel, address);
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.joinMember(member);
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			request.setAttribute("joinResult", "회원가입이 완료되었습니다");
		}else {
			request.setAttribute("joinResult", "회원가입이 실패되었습니다");
		}
	}
}