package com.lec.cb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.cb.vo.Comment;

public interface CommentService {
	public List<Comment> commentList(int bid, String commentPageNum, Model model);
	public int commentTotCnt(int bid);
	public int commentWrite(Comment comment, HttpServletRequest request);
	public int commentReply(Comment comment);
	public int commentModify(Comment comment, HttpServletRequest request);
	public int commentDelete(int bid);
	public Comment commentDetail(int cnum);
}
