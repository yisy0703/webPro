package com.lec.ck.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.ck.service.BService;
import com.lec.ck.vo.B;
// 
@Controller
@RequestMapping(value="bBoard")
public class BboardController {
	@Autowired
	private BService bService;
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String listBboard(B b, String pageNum, Model model) {
		model.addAttribute("list", bService.listBboard(b, pageNum, model));
		return "bBoard/list";
	}
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String writeBboard() {
		return "bBoard/write";
	}
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String writeBboard(B b, Model model) {
		bService.writeBboard(b, model);
		return "forward:list.do";
	}
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String detailBboard(int bno, Model model) {
		model.addAttribute("bBoard", bService.detailBboard(bno));
		return "bBoard/detail";
	}
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String updateBboard(int bno, Model model) {
		model.addAttribute("updateDto", bService.detailBboard(bno));
		return "bBoard/update";
	}
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String updateBboard(B b, Model model) {
		bService.updateBboard(b, model);
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String deleteBboard(int bno, Model model) {
		bService.deleteBboard(bno, model);
		return "forward:list.do";
	}
}
