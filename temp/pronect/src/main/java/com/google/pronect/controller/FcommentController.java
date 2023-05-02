package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.FcommentService;
import com.google.pronect.vo.Fcomment;

@Controller
@RequestMapping(value = "fcomment")
public class FcommentController {
	@Autowired
	private FcommentService fcommentService;
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write(Fcomment fcomment, Model model, HttpServletRequest request) {
		model.addAttribute("fcommentWriteResult", fcommentService.fcommentWrite(fcomment, request));
		return "forward:../fboard/content.do?fid="+fcomment.getFid();
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(Fcomment fcomment, String pageNum, String commentPageNum, Model model) {
		model.addAttribute("fcommentDeleteResult", fcommentService.fcommentDelete(fcomment.getFcid()));
		return "forward:../fboard/content.do?fid="+fcomment.getFid()+"&pageNum="+pageNum;
	}
	@RequestMapping(value = "modifyView", method = RequestMethod.GET)
	public String modifyView(int fcid, Model model) {
		model.addAttribute("fcomment", fcommentService.fcommentContent(fcid));
		return "fboard/commentModify";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(Fcomment fcomment, Model model) {
		model.addAttribute("fcommentModifyResult", fcommentService.fcommentModify(fcomment));
		return "forward:../fboard/content.do?fid="+fcomment.getFid();
	}
	@RequestMapping(value="replyView", method = RequestMethod.GET)
	public String replyView(int fcid, Model model) {
		model.addAttribute("fcomment", fcommentService.fcommentContent(fcid));
		return "fboard/commentReply";
	}
	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public String reply(Fcomment fcomment, Model model, HttpServletRequest request) {
		model.addAttribute("fcommentReplyResult", fcommentService.fcommentReply(fcomment, request));
		return "forward:../fboard/content.do?fid="+fcomment.getFid();
	}
}
