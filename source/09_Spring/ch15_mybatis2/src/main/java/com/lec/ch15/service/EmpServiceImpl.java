package com.lec.ch15.service;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lec.ch15.dao.DeptDao;
import com.lec.ch15.dao.EmpDao;
import com.lec.ch15.model.Dept;
import com.lec.ch15.model.Emp;
import com.lec.ch15.util.Paging;
@Service // 스프링컨테이너에게 서비스임을 알려주는 어노테이션(빈생성)
public class EmpServiceImpl implements EmpService {
	@Autowired
	private DeptDao deptDao;
	@Autowired
	private EmpDao  empDao;
	@Override
	public List<Dept> deptList() {
		return deptDao.deptList();
	}
	@Override
	public List<Emp> empList(String pageNum) {
		Paging paging = new Paging(empDao.totCnt(), pageNum, 10, 5);
		Emp emp = new Emp();
		emp.setStartRow(paging.getStartRow());
		emp.setEndRow(paging.getEndRow());
		return empDao.empList(emp);
	}
	@Override
	public List<Emp> empDeptList(String pageNum) {
		Paging paging = new Paging(empDao.totCnt(), pageNum, 10, 5);
		Emp emp = new Emp();
		emp.setStartRow(paging.getStartRow());
		emp.setEndRow(paging.getEndRow());
		return empDao.empDeptList(emp);
	}
	@Override
	public int totCnt() {
		return empDao.totCnt();
	}
	@Override
	public Emp detail(int empno) {
		return empDao.detail(empno);
	}
	@Override
	public List<Emp> managerList() {
		return empDao.managerList();
	}
	@Override
	public int insert(Emp emp) {
		return empDao.insert(emp);
	}
	@Override
	public int update(Emp emp) {
		return empDao.update(emp);
	}
	@Override
	public int delete(int empno) {
		return empDao.delete(empno);
	}
	@Override
	public void dummyDataInsert50() {
		Emp emp = new Emp();
		for(int i=3000 ; i<3030 ; i++) {
			emp.setEmpno(i);
			if(i%3==0) {
				emp.setEname("ㅎㅎㅎ");
			}else if(i%3==1) {
				emp.setEname("ㅊㅊㅊ");
			}else {
				emp.setEname("ㅌㅌㅌ");
			}
			emp.setJob("MANAGER");
			emp.setMgr(7968);
			emp.setHiredate(Date.valueOf("2023-04-01"));
			//emp.setHiredate(Timestamp.valueOf("2023-04-01 15:43:01"));
			emp.setSal(i);
			emp.setComm(i/10);
			emp.setDeptno(40);
			int result = empDao.insert(emp);
			System.out.println(result==1? i+"번째 사원등록":i+"번째 사원등록 실패");
		}
	}
}














