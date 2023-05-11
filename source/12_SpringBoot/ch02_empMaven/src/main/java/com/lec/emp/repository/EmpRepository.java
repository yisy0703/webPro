package com.lec.emp.repository;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.emp.model.Emp;
@Mapper
public interface EmpRepository {
	public List<Emp> empList(Emp emp);
}
