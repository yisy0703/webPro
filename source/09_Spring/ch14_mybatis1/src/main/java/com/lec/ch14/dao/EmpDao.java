package com.lec.ch14.dao;
import java.util.List;
import com.lec.ch14.dto.Emp;
public interface EmpDao {
	public List<Emp> empList(Emp schEmp);
}
