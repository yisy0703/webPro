package com.lec.ch09.controller;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MyController {
	// 모든 요청 경로의 jsp 페이지에 출력할 것
	@ModelAttribute("cnt")
	public int cnt() {
		return 4;
	}
	@ModelAttribute("list")
	public ArrayList<String> list(){
		ArrayList<String> list = new ArrayList<String>();
		list.add("test1"); list.add("test2");
		return list;
	}
	@RequestMapping(value="/")
	public String input() {
		// model.addAttribute("cnt", 5);
		return "member/input";
	}
}









