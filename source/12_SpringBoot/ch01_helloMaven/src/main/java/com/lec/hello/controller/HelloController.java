package com.lec.hello.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
public class HelloController {
	// @RequestMapping(value="/", method = RequestMethod.GET)
	@GetMapping("/")
	public String index(Model model) {
		log.info("첫 화면으로 감");
		model.addAttribute("greeting", "Hello, 스프링 부트");
		return "index"; // template/index.html
	}
	@GetMapping("/hello")
	public String hello(Model model) {
		log.info("Hello 요청 경로");
		model.addAttribute("data", "어서와 부트는 처음이지");
		return "hello";		
	}
}




