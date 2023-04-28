package com.tj.test06.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.test06.dao.MemberDao;
import com.tj.test06.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Override
	public Member login(Member member, HttpSession session) {
		member = memberDao.login(member);
		if(member!=null) {
			session.setAttribute("member", member);
		}
		return member;
	}

}
