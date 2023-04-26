package com.lec.cb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.cb.vo.Comment;

public interface CommentService {
	public List<Comment> commentList(int bid, String commentPageNum, Model model);
	public int commentTotCnt(int bid);
	public void commentWrite(Comment comment, HttpServletRequest request, Model model);
	public void commentReply(Comment comment, HttpServletRequest request, Model model);
	public void commentModify(Comment comment, HttpServletRequest request, Model model);
	public void commentDelete(int cnum, Model model);
	public Comment commentDetail(int cnum);
}
