package com.google.pronect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.pronect.service.GroupService;
import com.google.pronect.util.Paging;

@Controller
public class MainController {
	@Autowired
	private GroupService groupService;
	@RequestMapping(value = "main")
	public String main(String pageNum, Model model) {
		model.addAttribute("list",groupService.groupList(pageNum));
		model.addAttribute("name","group");
		model.addAttribute("paging",new Paging(groupService.groupTotCnt(),pageNum));
		return "main/main";
	}
}
