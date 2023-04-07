package com.lec.ch10.controller;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MyController {
	@RequestMapping(value="main", method=RequestMethod.GET)//main.do요청처리
	public String main() {
		return "main";
	}
	@RequestMapping(value="student")
	public String student(String id, Model model, HttpServletRequest request) {
		String method = request.getMethod(); // GET 또는 POST
		model.addAttribute("method", method);
		model.addAttribute("id", id);
		return "studentId";
	}
}

















