package com.lec.kmap.controller;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sessionTemplate;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("list", sessionTemplate.selectList("list"));		
		return "list";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(String id, Model model) {
		model.addAttribute("member", sessionTemplate.selectOne("getMember", id));
		return "detail";
	}
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() {
		return "testInput";
	}
}
