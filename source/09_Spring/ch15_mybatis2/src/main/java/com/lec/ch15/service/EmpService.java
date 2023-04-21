package com.lec.ch15.service;
import java.util.List;

import org.springframework.ui.Model;

import com.lec.ch15.model.Dept;
import com.lec.ch15.model.Emp;
public interface EmpService {
	public List<Dept> deptList();
	public List<Emp> empList(String pageNum);
	public List<Emp> empDeptList(String pageNum, Model model);
	public int totCnt();
	public Emp detail(int empno);
	public List<Emp> managerList();
	public int insert(Emp emp);
	public int update(Emp emp);
	public int delete(int empno);
	public void dummyDataInsert50();
}
