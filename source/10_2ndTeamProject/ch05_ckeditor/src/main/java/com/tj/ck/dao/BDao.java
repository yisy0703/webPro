package com.tj.ck.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tj.ck.dto.B;
@Mapper
public interface BDao {
	public List<B> list(B b);
	public int cnt(B b);
	public int write(B b);
	public B detail(int bno);
	public int update(B b);
	public int delete(int bno);
}
