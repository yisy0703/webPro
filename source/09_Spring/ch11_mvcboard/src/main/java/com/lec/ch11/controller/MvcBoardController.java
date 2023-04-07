package com.lec.ch11.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch11.dto.BoardDto;
import com.lec.ch11.service.BContentService;
import com.lec.ch11.service.BListService;
import com.lec.ch11.service.BWriteService;
import com.lec.ch11.service.Service;
@Controller
@RequestMapping("mvcBoard") // 공통요청경로
public class MvcBoardController {
	private Service bservice;
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(String pageNum, Model model) {
		// mvcBoard/list.do
		// mvcBoard/list.do?pageNum=10
		model.addAttribute("pageNum", pageNum);
		bservice = new BListService();
		bservice.execute(model);
		return "mvcBoard/list";
	}
	@RequestMapping(value="list", method=RequestMethod.POST)
	public String list_post(String pageNum, Model model) {
		// mvcBoard/list.do
		// mvcBoard/list.do?pageNum=10
		model.addAttribute("pageNum", pageNum);
		bservice = new BListService();
		bservice.execute(model);
		return "mvcBoard/list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		return "mvcBoard/write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute("bDto") BoardDto boardDto, 
						HttpServletRequest request,
						Model model) {
		// request : 서비스단에서 ip추출 용도
		model.addAttribute("request", request);
		bservice = new BWriteService();
		bservice.execute(model);
		return "forward:list.do";
	}
	@RequestMapping(value="content", method=RequestMethod.GET)
	public String content(int bid, Model model) {
		model.addAttribute("bid", bid);
		bservice = new BContentService();
		bservice.execute(model);
		return "mvcBoard/content";
	}
}

















