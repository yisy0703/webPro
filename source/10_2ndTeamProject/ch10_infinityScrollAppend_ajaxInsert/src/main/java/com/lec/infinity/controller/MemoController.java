package com.lec.infinity.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.infinity.service.MemoService;
import com.lec.infinity.vo.Memo;

@Controller
@RequestMapping(value="memo")
public class MemoController {
	@Autowired
	private MemoService memoService;
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model) {
		memoService.memoList(pageNum, model);
		return "memo/list";
	}
	@RequestMapping(value="insert100", method=RequestMethod.GET)
	public String insert100() {
		memoService.insert100();
		return "redirect:memo/list.do";
		//return "forward:list.do";
	}
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String memoInsert(Memo memo, Model model, HttpServletRequest request) {
		memoService.memoInsert(memo, model, request);
		return "memo/insertMemo";
	}
	@RequestMapping(value="append", method=RequestMethod.GET)
	public String append(String pageNum, Model model) {
		memoService.memoList(pageNum, model);
		return "memo/append";
	}
}