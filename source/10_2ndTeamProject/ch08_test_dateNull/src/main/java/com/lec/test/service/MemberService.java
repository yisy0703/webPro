package com.lec.test.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.test.vo.Member;

public interface MemberService {
	public int join(Member member, String birthTemp, String ageTemp, Model model);
	public List<Member> list();
}
