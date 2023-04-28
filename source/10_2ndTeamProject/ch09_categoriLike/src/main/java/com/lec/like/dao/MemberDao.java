package com.lec.like.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.like.vo.Member;
@Mapper
public interface MemberDao {
	public Member loginChk(Member member);
}
