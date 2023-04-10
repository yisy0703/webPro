package com.lec.ch13.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class FileController {
	@RequestMapping(value="fileup", method=RequestMethod.GET)
	public String fileup() {
		return "fileUp";
	}
}
