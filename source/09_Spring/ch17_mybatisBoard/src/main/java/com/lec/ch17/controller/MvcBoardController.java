package com.lec.ch17.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("mvcBoard") // 공통요청경로
public class MvcBoardController {
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(String pageNum, Model model) {
		model.addAttribute("msg", "안녕");
		return "home";
	}
}
