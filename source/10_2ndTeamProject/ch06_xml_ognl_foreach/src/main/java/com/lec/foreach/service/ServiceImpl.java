package com.lec.foreach.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.foreach.dao.Dao;
import com.lec.foreach.vo.Dept;
import com.lec.foreach.vo.Emp;
@Service
public class ServiceImpl implements IService {
	@Autowired
	private Dao dao;
	@Override
	public List<Dept> deptList() {
		return dao.deptList();
	}

	@Override
	public List<Emp> empList(int[] deptnos) {
		List<Integer> deptno = new ArrayList<Integer>();
		if(deptnos!=null) {
			for(int dept : deptnos) {
				deptno.add(dept);
			}
		}else {
			deptno.add(0);
		}
		return dao.empList(deptno);
	}

}
