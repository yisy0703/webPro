package com.lec.foreach.service;

import java.util.List;

import com.lec.foreach.vo.Dept;
import com.lec.foreach.vo.Emp;

public interface IService {
	public List<Dept> deptList();
	public List<Emp> empList(int[] deptnos);
}
