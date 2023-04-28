package com.tj.test06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tj.test06.dto.Category;
import com.tj.test06.dto.Clike;
@Mapper
public interface ClikeDao {
	public List<Category> categoryList();
	public List<Clike> myClikeList(String mid);
	public int myClikeInsert(Clike clike);
	public int myClikeDelete(Clike clike);
}
