package com.lec.sn.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.sn.service.BoardService;
import com.lec.sn.vo.Board;
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", boardService.list());
		return "list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm() {
		return "write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(Board board, MultipartHttpServletRequest mRequest, Model model) {
		boardService.write(board, mRequest, model);
		return "redirect:list.do";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int bNo, Model model) {
		model.addAttribute("dto", boardService.detail(bNo));
		return "detail";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(int bNo, Model model) {
		model.addAttribute("dto", boardService.detail(bNo));
		return "update";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Board board, MultipartHttpServletRequest mRequest, Model model) {
		boardService.update(board, mRequest, model);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int bNo, Model model) {
		boardService.delete(bNo, model);
		return "redirect:list.do";
	}
}
