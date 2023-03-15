package com.lec.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.ex.dao.MemberDao;
public class MemailConfirmService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.memailConfirm(memail);
		if(result == MemberDao.EXISTENT){
			request.setAttribute("emailConfirmResult","<b>사용 불가한 중복된 메일</b>");
		}else{
			request.setAttribute("emailConfirmResult","사용 가능한 메일");
		}
	}
}








