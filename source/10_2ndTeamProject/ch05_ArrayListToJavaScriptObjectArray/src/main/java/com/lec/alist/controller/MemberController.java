package com.lec.alist.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.alist.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {
	@ModelAttribute("list")
	public ArrayList<Member> list(){
		ArrayList<Member> list = new ArrayList<Member>();
		list.add(new Member("aaa", "111", "홍길동", 22));
		list.add(new Member("bbb", "222", "유길동", 26));
		list.add(new Member("ccc", "333", "신길동", 32));
		return list;
	}
	@RequestMapping("input")
	public String input(Model model) {
		ArrayList<String> test = new ArrayList<String>();
		test.add("하하");
		test.add("호호");
		model.addAttribute("test", test);
		return "member/input";
	}
}
