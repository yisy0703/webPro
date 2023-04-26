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
		commentService.commentWrite(comment, request, model);
		return "forward:../mvcboard/content.do";
	}
	@RequestMapping(value="delete")
	public String delete(Comment comment, String pageNum, String comPageNum, Model model) {
		commentService.commentDelete(comment.getCnum(), model);
		return "forward:../mvcboard/content.do";
	}
	@RequestMapping(value = "modifyView")
	public String modifyView(int cnum, Model model) {
		model.addAttribute("comment", commentService.commentDetail(cnum));
		return "mvcboard/commentModifyView";
	}
	@RequestMapping(value = "modify")
	public String modify(Comment comment, HttpServletRequest request, Model model) {
		commentService.commentModify(comment, request, model);
		return "forward:../mvcboard/content.do";
	}
	@RequestMapping(value="replyView")
	public String replyView(int cnum, Model model) {
		model.addAttribute("comment", commentService.commentDetail(cnum));
		return "mvcboard/commentReplyView";
	}
	@RequestMapping(value="reply")
	public String reply(Comment comment, HttpServletRequest request, Model model) {
		commentService.commentReply(comment, request, model);
		return "forward:../mvcboard/content.do";
	}
}
