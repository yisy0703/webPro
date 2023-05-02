package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.service.QboardService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Qboard;

@Controller
@RequestMapping("qboard")
public class QboardController {
	@Autowired
	private QboardService qboardService;
	
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Qboard qboard, Model model, String pageNum) {
		model.addAttribute("qboardList", qboardService.qboardList(qboard, pageNum));
		model.addAttribute("paging", new Paging(qboardService.totCntQboard(qboard), pageNum));
		return "qboard/list";
	}
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "qboard/write";
	}
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Qboard qboard, Model model, 
			MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		model.addAttribute("writeResult", qboardService.writeQboard(qboard, mRequest, request));
		return "forward:list.do";
	}
	@RequestMapping(value = "content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int qid, Model model, String commentPageNum) {
		model.addAttribute("qDto", qboardService.contentQboard(qid));
		//TODO 여기에 댓글 로직 추가
		return "qboard/content";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(int qid, Model model) {
		model.addAttribute("qDto", qboardService.contentQboard(qid));
		return "qboard/modify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("qDto") Qboard qboard, Model model, 
			MultipartHttpServletRequest mRequest) {
		model.addAttribute("modifyResult", qboardService.modifyQboard(qboard, mRequest));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int qid, Model model) {
		model.addAttribute("deleteResult", qboardService.deleteQboard(qid));
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method = RequestMethod.GET)
	public String reply(int qid, Model model) {
		model.addAttribute("qDto",qboardService.contentQboard(qid));
		return "qboard/reply";
	}
	@RequestMapping(value="reply", method = RequestMethod.POST)
	public String reply(@ModelAttribute("qDto") Qboard qboard, Model model, 
			MultipartHttpServletRequest mRequest) {
		model.addAttribute("replyResult", qboardService.replyQboard(qboard, mRequest));
		return "forward:list.do";
	}
}
