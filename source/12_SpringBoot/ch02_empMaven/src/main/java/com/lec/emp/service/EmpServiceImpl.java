package com.lec.emp.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lec.emp.model.Dept;
import com.lec.emp.model.Emp;
import com.lec.emp.repository.DeptRepository;
import com.lec.emp.repository.EmpRepository;
@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private DeptRepository deptRepository;
	@Autowired
	private EmpRepository empRepository;
	@Override
	public List<Dept> deptList() {
		return deptRepository.deptList();
	}
	@Override
	public List<Emp> empList(Emp searchEmp) {
		if(searchEmp.getEname()!=null) {
			searchEmp.setEname(searchEmp.getEname().toUpperCase());
		}
		if(searchEmp.getJob()!=null) {
			searchEmp.setJob(searchEmp.getJob().toUpperCase());
		}
		return empRepository.empList(searchEmp);
	}

}
