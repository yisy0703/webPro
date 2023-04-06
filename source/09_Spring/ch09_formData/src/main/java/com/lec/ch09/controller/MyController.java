package com.lec.ch09.controller;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
//	@RequestMapping(value="studentId/*")
//	public String studentId(HttpServletRequest request, Model model) 
//									throws UnsupportedEncodingException {
//		String uri = request.getRequestURI(); // "/ch09/studentId/aaa"
//		String id = uri.substring(uri.lastIndexOf("/") + 1);
//		id = URLDecoder.decode(id, "utf-8");
//		model.addAttribute("id", id);
//		return "studentId";
//	}
	@RequestMapping(value="studentId/{id}")
	public String studentId(@PathVariable("id") String id, Model model) {
		model.addAttribute("id", id);
		return "studentId";
	}
}
















