package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Fboard;

@Mapper
public interface FboardDao {
	public List<Fboard> fboardList(Fboard fboard);
	public int totCntFboard(Fboard fboard);
	public int writeFboard(Fboard fboard);
	public int hitUpFboard(int fid);
	public Fboard contentFboard(int fid);
	public int modifyFboard(Fboard fboard);
	public int deleteFboard(int fid);
	public int replyFboardPreStep(Fboard fboard);
	public int replyFboard(Fboard fboard);
}
