package com.lec.ch15.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.ch15.model.Dept;
@Mapper
public interface DeptDao {
	public List<Dept> deptList();
}
