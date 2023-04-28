package com.lec.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.like.vo.Category;
import com.lec.like.vo.Clike;

@Mapper
public interface ClikeDao {
	public List<Category> categoryList();
	public List<Clike> myClikeList(String mid);
	public int insertLike(Clike clike);
	public int deleteLike(Clike clike);
}
