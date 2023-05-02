package com.google.pronect.dao;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Group;

@Mapper
public interface GDao {
	public int reG(Group group);
}
