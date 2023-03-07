package com.lec.service;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.dao.MemberDao;
import com.lec.dto.MemberDto;
public class MemberListService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// memberList.do 요청 로직
		MemberDao mDao = MemberDao.getInstance();
		ArrayList<MemberDto> memberList = mDao.listMember();
		request.setAttribute("memberList", memberList);
	}
}
