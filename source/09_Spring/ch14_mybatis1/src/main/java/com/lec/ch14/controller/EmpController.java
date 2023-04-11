package com.lec.ch14.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch14.dto.Dept;
import com.lec.ch14.dto.Emp;
import com.lec.ch14.service.EmpService;
@Controller
public class EmpController {
	@Autowired
	private EmpService service;
	@ModelAttribute("deptList")
	public List<Dept> deptList(){
		return service.deptList();
	}
	// emp.do?ename=s&job=m&deptno=20
	// emp.do
	@RequestMapping(value="emp", method=RequestMethod.GET)
	public String emp(@ModelAttribute("schEmp") Emp schEmp, Model model) {
		model.addAttribute("empList", service.empList(schEmp));
		return "emp";
	}
}












