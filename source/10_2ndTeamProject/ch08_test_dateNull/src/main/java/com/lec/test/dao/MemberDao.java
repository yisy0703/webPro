package com.lec.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.test.vo.Member;

@Mapper
public interface MemberDao {
	public int join(Member member);
	public List<Member> list();
}
