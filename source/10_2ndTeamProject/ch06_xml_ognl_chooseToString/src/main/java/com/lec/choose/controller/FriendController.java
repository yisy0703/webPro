package com.lec.choose.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.choose.dao.FriendDao;
import com.lec.choose.vo.Friend;

@Controller
public class FriendController {
	@Autowired
	private FriendDao friendDao;
	@RequestMapping(value="list")
	public String listFriend(Model model) {
		model.addAttribute("listFriend", friendDao.listFriend());
		return "list";
	}
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(Friend friend, Model model) {
		System.out.println("저장전 : "+friend);
		model.addAttribute("result", friendDao.joinFriend(friend));
		model.addAttribute("no", friendDao.getNo());
		return "forward:list.do";
	}
}
