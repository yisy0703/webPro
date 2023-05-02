package com.google.pronect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.GroupBoardReplyService;
import com.google.pronect.service.GroupBoardService;
import com.google.pronect.service.GroupService;
import com.google.pronect.vo.GroupBoard;

@Controller
@RequestMapping("groupBoard")
public class GroupBoardController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupBoardService groupBoardService;
	@RequestMapping(value="list", method={RequestMethod.GET, RequestMethod.POST})
	public String groupBoardList(GroupBoard groupboard, int gid, String pageNum, Model model) {
		System.out.println("1. groupBoardList");
		model.addAttribute("groupBoard", groupBoardService.groupBoardList(groupboard, pageNum, model));
		System.out.println("2. getGroupDetail");
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		System.out.println(groupBoardService.groupBoardList(groupboard, pageNum, model));
		System.out.println(groupService.getGroupDetail(gid));
		return "group/groupBoard";
	}
}
