package com.lec.ch19.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MainController {
	@RequestMapping(value="main", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) {
		return "main/main";
	}
}
