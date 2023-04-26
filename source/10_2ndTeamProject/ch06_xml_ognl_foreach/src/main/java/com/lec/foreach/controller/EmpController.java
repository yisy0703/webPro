package com.lec.foreach.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.foreach.service.IService;
import com.lec.foreach.vo.Dept;

@Controller
public class EmpController {
	@Autowired
	private IService service;
	@ModelAttribute(value="deptList")
	public List<Dept> deptList(){
		return service.deptList();
	}
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String test(int[] deptnos, Model model) {
		model.addAttribute("empList", service.empList(deptnos));
		return "empList";
	}
}
