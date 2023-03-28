package com.lec.map.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.map.dao.MemberDao;
import com.lec.map.dto.MemberDto;

public class JoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		MemberDto newMember = new MemberDto(id, pw, name, postcode, address, detailAddress);
		MemberDao memberDao = new MemberDao();
		int result = memberDao.join(newMember);
		request.setAttribute("joinResult", result);
	}

}
