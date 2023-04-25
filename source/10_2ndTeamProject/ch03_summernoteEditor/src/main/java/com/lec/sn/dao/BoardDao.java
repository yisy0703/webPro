package com.lec.sn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.sn.vo.Board;
@Mapper
public interface BoardDao {
	public List<Board> list();
	public int write(Board board);
	public Board detail(int bNo);
	public int update(Board board);
	public int delete(int bNo);
	public int getCnt();
}
