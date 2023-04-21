package com.lec.ck.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ck.service.BService;
import com.lec.ck.vo.B;
@Controller
@RequestMapping(value="bBoard")
public class BboardController {
	@Autowired
	private BService bService;
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(B b, String pageNum, Model model) {
		model.addAttribute("x", "Hello");
		model.addAttribute("list", bService.listBboard(b, pageNum, model));
		return "bBoard/list";
	}
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String write() {
		return "bBoard/write";
	}
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(Model model) {
		return "bBoard/write";
	}
}
