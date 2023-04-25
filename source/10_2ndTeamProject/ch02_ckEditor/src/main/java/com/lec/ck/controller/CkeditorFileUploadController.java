package com.lec.ck.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.ck.service.BService;
@Controller
public class CkeditorFileUploadController {
	@Autowired
	private BService bService;
	@RequestMapping(value="fileupload", method=RequestMethod.POST)
	@ResponseBody
	public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile){
		bService.imageUpload(req, resp, multiFile);
	}
}
