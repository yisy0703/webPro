package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.GComment;

@Mapper
public interface GCommentDao {
	public int comment(GComment gcomment);
	public List<GComment> commentContent(int gid);
	public int commentModify(GComment gcomment); 
	public int commentDelete(int gcid);
	public int commentCnt(int gid);
}
