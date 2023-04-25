package com.lec.cb.dao;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.lec.cb.dto.Comment;
@Mapper
public interface CommentDao {
	public List<Comment> commentList(Comment comment);
	public int commentTotCnt(int bid);
	public int commentWrite(Comment comment);
	public int commentReplyPreStep(Comment comment);
	public int commentReply(Comment comment);
	public int commentModify(Comment comment);
	public int commentDelete(int cnum);
	public Comment commentDetail(int cnum);
}
