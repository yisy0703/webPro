package com.lec.ch15.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lec.ch15.model.Emp;
@Repository
public class EmpDaoImpl implements EmpDao {
	@Autowired
	private SqlSession template;
	@Override
	public List<Emp> empList(Emp emp) {
		return template.selectList("empList", emp);
	}
	@Override
	public List<Emp> empDeptList(Emp emp) {
		return template.selectList("empDeptList", emp);
	}
	@Override
	public int totCnt() {
		return template.selectOne("totCnt");
	}
	@Override
	public Emp detail(int empno) {
		return template.selectOne("detail", empno);
	}
	@Override
	public List<Emp> managerList() {
		return template.selectList("managerList");
	}
	@Override
	public int insert(Emp emp) {
		return template.insert("insert", emp);
	}
	@Override
	public int update(Emp emp) {
		return template.update("update", emp);
	}
	@Override
	public int delete(int empno) {
		return template.delete("delete", empno);
	}
}











