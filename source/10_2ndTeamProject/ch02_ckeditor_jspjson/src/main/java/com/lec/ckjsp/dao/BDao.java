package com.lec.ckjsp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.ckjsp.vo.B;

@Mapper
public interface BDao {
	public int writeBboard(B b);
	public List<B> listBboard(B b);
	public int cntBboard(B b);
	public B detailBboard(int bno);
	public int updateBboard(B b);
	public int deleteBboard(int bno);
}
