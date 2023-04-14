package com.lec.ch19.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch19.service.BookService;
@Controller
public class MainController {
	@Autowired
	private BookService BookService;
	@RequestMapping(value="main", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) {
		model.addAttribute("mainList", BookService.mainList());
		return "main/main";
	}
}
