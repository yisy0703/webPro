package com.lec.ck.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ck.vo.FileUpVO;
import com.lec.ck.service.BService;
@Controller
public class CkeditorFileUploadController {
	@Autowired
	private BService bService;
	@RequestMapping(value="fileupload", method=RequestMethod.POST)
	public String fileUpload(FileUpVO fileUpVO, HttpServletRequest request , Model model){
		System.out.println("컨트롤러 : fileUploadVO : " + fileUpVO);
		fileUpVO = bService.fileUp(fileUpVO, request);
		model.addAttribute("filePath", fileUpVO.getAttachPath() + fileUpVO.getFilename());  
		//model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
		return "bBoard/ckeditorImageUpload";
    }
}
