package com.lec.like.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lec.like.vo.Member;

public interface MemberService {
	public Member loginChk(Member member, HttpSession session);
}
