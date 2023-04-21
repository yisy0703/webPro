package com.lec.ck.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ck.service.BService;
import com.lec.ck.vo.FileUpVO;

@Controller
public class CkeditorFileUploadController {
	@Autowired
	private BService bService;
	@RequestMapping(value="fileupload", method=RequestMethod.POST)
	public String fileUpload(FileUpVO fileUploadVO, HttpServletRequest request , Model model){
		fileUploadVO = bService.fileUp(fileUploadVO, request);
		model.addAttribute("filePath", fileUploadVO.getAttachPath() + fileUploadVO.getFilename());  
		//model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
		return "bBoard/ckeditorImageUpload";
    }
}
