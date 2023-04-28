package com.tj.test06.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.test06.dto.Clike;
import com.tj.test06.dto.Member;
import com.tj.test06.service.ClikeService;
import com.tj.test06.service.MemberService;

@Controller
public class MyController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ClikeService clikeService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Member member, Model model, HttpSession session) {
		member = memberService.login(member, session);
		if(member!=null) {
			return "loginSuccess";
		}else {
			model.addAttribute("failMsg", "id나 pw를 체크하세요");
			return "login";
		}
	}
	@RequestMapping(value = "categoryList", method = RequestMethod.GET)
	public String categoryList(Model model, HttpSession session) {
		model.addAttribute("catgoryList",clikeService.categoryList());
		model.addAttribute("mylist", clikeService.myClikeList(session));
		return "categoryList";
	}
	@RequestMapping(value="insertClike", method = RequestMethod.GET)
	public String insertClike(Clike clike, Model model, HttpSession session) {
		clikeService.myClikeInsert(clike, session, model);
		return "redirect:categoryList.do";
	}
	@RequestMapping(value="deleteClike", method = RequestMethod.GET)
	public String myClikeDelete(Clike clike, Model model, HttpSession session) {
		clikeService.myClikeDelete(clike, session, model);
		return "redirect:categoryList.do";
	}
}
