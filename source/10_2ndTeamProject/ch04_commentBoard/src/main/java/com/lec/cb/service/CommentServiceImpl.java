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
	public void commentWrite(Comment comment, HttpServletRequest request, Model model) {
		comment.setCip(request.getRemoteAddr());
		int result = commentDao.commentWrite(comment);
		if(result == 1) {
			model.addAttribute("commentResult", "댓글이 등록되었습니다");
		}else {
			model.addAttribute("commentResult", "댓글 등록이 실패되었습니다");
		}
	}

	@Override
	public void commentReply(Comment comment, HttpServletRequest request, Model model) {
		comment.setCip(request.getRemoteAddr());
		commentDao.commentReplyPreStep(comment);
		int result = commentDao.commentReply(comment);
		if(result == 1) {
			model.addAttribute("commentResult", comment.getCnum() + "번 댓글에 답변하였습니다");
		}else {
			model.addAttribute("commentResult", comment.getCnum() + "번 댓글을에 답변이 실패되었습니다");
		}
	}

	@Override
	public void commentModify(Comment comment, HttpServletRequest request, Model model) {
		comment.setCip(request.getRemoteAddr());
		int result = commentDao.commentModify(comment);
		if(result == 1) {
			model.addAttribute("commentResult", comment.getCnum() + "번 댓글을 수정하였습니다");
		}else {
			model.addAttribute("commentResult", comment.getCnum() + "번 댓글을 수정이 실패되었습니다");
		}
	}

	@Override
	public void commentDelete(int cnum, Model model) {
		int result = commentDao.commentDelete(cnum);
		if(result == 1) {
			model.addAttribute("commentResult", cnum + "번 댓글을 삭제하였습니다");
		}else {
			model.addAttribute("commentResult", cnum + "번 댓글 삭제가 실패되었습니다");
		}
	}

	@Override
	public Comment commentDetail(int cnum) {
		return commentDao.commentDetail(cnum);
	}

}
