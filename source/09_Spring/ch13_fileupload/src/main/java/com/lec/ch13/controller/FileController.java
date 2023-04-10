package com.lec.ch13.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.lec.ch13.service.FileUpService;
@Controller
public class FileController {
	@Autowired
	private FileUpService fService;
	@RequestMapping(value="fileup", method=RequestMethod.GET)
	public String fileup() {
		return "fileUp";
	}
	@RequestMapping(value="fileup", method=RequestMethod.POST)
	public ModelAndView fileup(MultipartHttpServletRequest mRequest, 
			ModelAndView mav) {
		if(fService.fileUp(mRequest, mav)) {
			
		}
	}
}















