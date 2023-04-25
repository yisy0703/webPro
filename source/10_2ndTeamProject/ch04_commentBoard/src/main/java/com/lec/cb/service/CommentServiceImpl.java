package com.lec.cb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.cb.dao.CommentDao;
import com.lec.cb.util.Paging;
import com.lec.cb.vo.Comment;
@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	@Override
	public List<Comment> commentList(int bid, String commentPageNum, Model model) {
		Comment comment = new Comment();
		Paging paging = new Paging(commentDao.commentTotCnt(bid), commentPageNum, 5, 5);
		comment.setBid(bid);
		comment.setStartRow(paging.getStartRow());
		comment.setEndRow(paging.getEndRow());
		model.addAttribute("comPaging", paging);
		return commentDao.commentList(comment);
	}

	@Override
	public int commentTotCnt(int bid) {
		return commentDao.commentTotCnt(bid);
	}

	@Override
	public int commentWrite(Comment comment, HttpServletRequest request) {
		comment.setCip(request.getRemoteAddr());
		System.out.println("저장 될 댓글 데이터 : " + comment);
		return commentDao.commentWrite(comment);
	}

	@Override
	public int commentReply(Comment comment) {
		commentDao.commentReplyPreStep(comment);
		return commentDao.commentReply(comment);
	}

	@Override
	public int commentModify(Comment comment, HttpServletRequest request) {
		comment.setCip(request.getRemoteAddr());
		return commentDao.commentModify(comment);
	}

	@Override
	public int commentDelete(int bid) {
		return commentDao.commentDelete(bid);
	}

	@Override
	public Comment commentDetail(int cnum) {
		// TODO Auto-generated method stub
		return commentDao.commentDetail(cnum);
	}

}
