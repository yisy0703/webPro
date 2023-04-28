package com.lec.like.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.like.dao.MemberDao;
import com.lec.like.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Override
	public Member loginChk(Member member, HttpSession session) {
		member = memberDao.loginChk(member);
		if(member!=null) {
			session.setAttribute("member", member);
		}
		return member;
	}

}
