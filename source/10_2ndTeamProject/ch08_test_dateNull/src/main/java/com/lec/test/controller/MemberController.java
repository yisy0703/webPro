package com.lec.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.test.service.MemberService;
import com.lec.test.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("list", memberService.list());
		return "list";
	}
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(Member member, String birthTemp, String ageTemp, Model model) {
		memberService.join(member,birthTemp, ageTemp, model);
		return "forward:list.do";
	}
}
