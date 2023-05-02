package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Qboard;

@Mapper
public interface QboardDao {
	public List<Qboard> qboardList(Qboard qboard);
	public int totCntQboard(Qboard qboard);
	public int writeQboard(Qboard qboard);
	public int hitUpQboard(int fid);
	public Qboard contentQboard(int fid);
	public int modifyQboard(Qboard qboard);
	public int deleteQboard(int fid);
	public int replyQboardPreStep(Qboard qboard);
	public int replyQboard(Qboard qboard);
}
