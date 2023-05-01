package com.lec.foreach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.foreach.vo.Dept;
import com.lec.foreach.vo.Emp;
@Mapper
public interface Dao {
	public List<Dept> deptList();
	public List<Emp> empList(Emp emp);
}
