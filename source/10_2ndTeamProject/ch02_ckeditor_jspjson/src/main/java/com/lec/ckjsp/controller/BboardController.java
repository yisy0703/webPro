package com.lec.ckjsp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.ckjsp.service.BService;
import com.lec.ckjsp.vo.B;
// 
@Controller
public class BboardController {
	@Autowired
	private BService bService;
	@RequestMapping(value="listBboard", method = {RequestMethod.GET, RequestMethod.POST})
	public String listBboard(B b, String pageNum, Model model) {
		model.addAttribute("list", bService.listBboard(b, pageNum, model));
		return "bBoard/list";
	}
	@RequestMapping(value="writeBboard", method = RequestMethod.GET)
	public String writeBboard() {
		return "bBoard/write";
	}
	@RequestMapping(value="writeBboard", method = RequestMethod.POST)
	public String writeBboard(B b, MultipartHttpServletRequest mRequest, Model model) {
		bService.writeBboard(mRequest, b, model);
		return "forward:listBboard.do";
	}
	@RequestMapping(value="detailBboard", method = RequestMethod.GET)
	public String detailBboard(int bno, Model model) {
		model.addAttribute("bBoard", bService.detailBboard(bno));
		return "bBoard/detail";
	}
	@RequestMapping(value="updateBboard", method = RequestMethod.GET)
	public String updateBboard(int bno, Model model) {
		model.addAttribute("updateDto", bService.detailBboard(bno));
		return "bBoard/update";
	}
	@RequestMapping(value="updateBboard", method = RequestMethod.POST)
	public String updateBboard(MultipartHttpServletRequest mRequest, Model model) {
		bService.updateBboard(mRequest, model);
		return "forward:listBboard.do";
	}
	@RequestMapping(value="deleteBboard", method=RequestMethod.GET)
	public String deleteBboard(int bno, Model model) {
		bService.deleteBboard(bno, model);
		return "forward:listBboard.do";
	}
}
