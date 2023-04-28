package com.tj.test06.service;

import javax.servlet.http.HttpSession;

import com.tj.test06.dto.Member;

public interface MemberService {
	public Member login(Member member, HttpSession session);
}
