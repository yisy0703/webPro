package com.lec.cb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.cb.service.CommentService;
import com.lec.cb.vo.Comment;

@Controller
@RequestMapping(value="comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	@RequestMapping(value="write")
	public String write(Comment comment, Model model, HttpServletRequest request) {
		model.addAttribute("replyWriteResult", commentService.commentWrite(comment, request));
		return "forward:../mvcboard/content.do?bid="+comment.getBid();
	}
	@RequestMapping(value="delete")
	public String delete(Comment comment, String pageNum, String comPageNum, Model model) {
		model.addAttribute("replyWriteResult", commentService.commentDelete(comment.getCnum()));
		return "forward:../mvcboard/content.do?bid="+comment.getBid()+"&pageNum="+pageNum;
	}
	@RequestMapping(value = "modifyView")
	public String modifyView(int cnum, Model model) {
		model.addAttribute("comment", commentService.commentDetail(cnum));
		return "mvcboard/commentModifyView";
	}
	@RequestMapping(value = "modify")
	public String modify(Comment comment, Model model, HttpServletRequest request) {
		model.addAttribute("commentModifyResult", commentService.commentModify(comment, request));
		return "forward:../mvcboard/content.do?bid="+comment.getBid();
	}
	@RequestMapping(value="replyView")
	public String replyView(int cnum, Model model) {
		model.addAttribute("comment", commentService.commentDetail(cnum));
		return "mvcboard/commentReplyView";
	}
}
