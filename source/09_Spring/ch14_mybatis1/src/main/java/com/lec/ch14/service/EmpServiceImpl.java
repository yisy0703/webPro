package com.lec.ch14.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.ch14.dao.DeptDao;
import com.lec.ch14.dao.EmpDao;
import com.lec.ch14.dto.Dept;
import com.lec.ch14.dto.Emp;
@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao eDao;
	@Autowired
	private DeptDao dDao;
	@Override
	public List<Dept> deptList() {
		return dDao.deptList();
	}
	@Override
	public List<Emp> empList(Emp schEmp) {
		// schEmp.ename = s / schEmp.job = e
		if(schEmp.getEname()!=null) {
			schEmp.setEname(schEmp.getEname().toUpperCase());
		}
		if(schEmp.getJob()!=null) {
			schEmp.setJob(schEmp.getJob().toUpperCase());
		}
		return eDao.empList(schEmp);
	}

}








