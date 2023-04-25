package com.lec.cb.controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.cb.dto.Board;
import com.lec.cb.service.BoardService;
import com.lec.cb.service.CommentService;
import com.lec.cb.util.Paging;
@Controller
@RequestMapping("mvcboard")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentService commentService;
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, String comPageNum,  Model model) {
		model.addAttribute("boardList", boardService.boardList(pageNum));
		model.addAttribute("paging", new Paging(boardService.boardTotCnt(), pageNum));
		return "mvcboard/list";
	}
	@RequestMapping(value = "writeView", method = RequestMethod.GET)
	public String writeView() {
		return "mvcboard/write";
	}
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Board board, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult", boardService.boardWrite(board, request));
		return "forward:list.do";
	}
	@RequestMapping(value="content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int bid, Model model, String comPageNum) {
		model.addAttribute("bDto",boardService.boardContent(bid));
		model.addAttribute("commentList", commentService.commentList(bid, comPageNum));
		model.addAttribute("comPaging", new Paging(commentService.commentTotCnt(bid), comPageNum, 5, 5));
		return "mvcboard/content";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyView(int bid, Model model) {
		model.addAttribute("bDto",boardService.boardModifyReplyView(bid));
		return "mvcboard/modify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(Board board, Model model, HttpServletRequest request) {
		model.addAttribute("modifyResult", boardService.boardModify(board, request));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int bid, Model model) {
		model.addAttribute("deleteResult", boardService.boardDelete(bid));
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method = RequestMethod.GET)
	public String replyView(int bid, Model model) {
		model.addAttribute("bDto",boardService.boardModifyReplyView(bid));
		return "mvcboard/reply";
	}
	@RequestMapping(value="reply", method = RequestMethod.POST)
	public String reply(Board board, HttpServletRequest request, Model model) {
		model.addAttribute("replyResult", boardService.boardReply(board, request));
		return "forward:list.do";
	}
}