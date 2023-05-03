package com.lec.json.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.json.vo.Ex;

@Mapper
public interface ExDao {
	public List<Ex> select();
	public int insert(Ex ex);
}
