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
	public List<Emp> empList(int[] deptnos, Emp emp) {
		List<Integer> tempDeptnos = new ArrayList<Integer>();
		if(deptnos!=null) {
			for(int dept : deptnos) {
				tempDeptnos.add(dept);
			}
		}else {
			tempDeptnos.add(0);
		}
		emp.setDeptnos(tempDeptnos);
		return dao.empList(emp);
	}

}
