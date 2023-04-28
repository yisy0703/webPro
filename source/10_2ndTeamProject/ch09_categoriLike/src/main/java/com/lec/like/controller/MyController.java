package com.lec.like.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.like.service.ClikeService;
import com.lec.like.service.MemberService;
import com.lec.like.vo.Clike;
import com.lec.like.vo.Member;

@Controller
public class MyController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ClikeService clikeService;
	@RequestMapping(value="/", method = {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		return "main";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("mDto") Member member, Model model, HttpSession session, String after) { // 모델attribute와 session attribute 이름이 같으면 model이 우선순위 높음
		member = memberService.loginChk(member, session);
		if(member!=null) {
			return "redirect:"+after;
		}else {
			model.addAttribute("failMsg", "id나 pw를 체크하세요");
			return "login";
		}
	}
	@RequestMapping(value="loginOut", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "forward:/";
	}	
	@RequestMapping(value = "categoryList", method = RequestMethod.GET)
	public String categoryList(Model model, HttpSession session) {
		model.addAttribute("catgoryList",clikeService.categoryList());
		model.addAttribute("mylist", clikeService.myClikeList(session));
		return "categoryList";
	}
	@RequestMapping(value="insertLike", method = RequestMethod.GET)
	public String insertLike(Clike clike, HttpSession session, Model model) {
		clikeService.insertLike(clike, session, model);
		return "forward:categoryList";
	}
	@RequestMapping(value="deleteLike", method = RequestMethod.GET)
	public String deleteLike(Clike clike, HttpSession session, Model model) {
		clikeService.deleteLike(clike, session, model);
		return "forward:categoryList";
	}
}
