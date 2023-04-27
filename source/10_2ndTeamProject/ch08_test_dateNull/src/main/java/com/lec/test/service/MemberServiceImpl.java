package com.lec.test.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.test.dao.MemberDao;
import com.lec.test.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Override
	public int join(Member member, String birthTemp, String ageTemp, Model model) {
		if(!birthTemp.equals("")) {
			member.setBirth(Date.valueOf(birthTemp));
		}
		if(!ageTemp.equals("")) {
			member.setAge(Integer.parseInt(ageTemp));
		}
		System.out.println(member);
		return memberDao.join(member);
	}

	@Override
	public List<Member> list() {
		return memberDao.list();
	}

}
