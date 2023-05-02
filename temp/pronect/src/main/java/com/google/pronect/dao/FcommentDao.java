package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Fcomment;

@Mapper
public interface FcommentDao {
	public List<Fcomment> fcommentList(Fcomment fcomment);
	public int fcommentTotCnt(int fid);
	public int fcommentWrite(Fcomment fcomment);
	public int fcommentReplyPreStep(Fcomment fcomment);
	public int fcommentReply(Fcomment fcomment);
	public int fcommentModify(Fcomment fcomment);
	public int fcommentDelete(int fcid);
	public Fcomment fcommentContent(int fcid);
}
