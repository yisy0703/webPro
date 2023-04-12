package com.lec.ch15.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch15.model.Emp;
import com.lec.ch15.service.EmpService;
import com.lec.ch15.util.Paging;
@Controller
public class EmpController {
	@Autowired
	private EmpService empService;
	@RequestMapping(value="empList", method=RequestMethod.GET)
	public String empList(String pageNum, Model model) {
		// empList.do 또는 empList.do?pageNum=2
		model.addAttribute("empList", empService.empList(pageNum));
		model.addAttribute("paging", new Paging(empService.totCnt(), pageNum, 10, 5));
		return "empList";
	}
	@RequestMapping(value="dummyInsert", method=RequestMethod.GET)
	public String dummyInsert() {
		empService.dummyDataInsert50();
		return "redirect:empList.do";
	}
	@RequestMapping(value="empDeptList", method= {RequestMethod.GET, RequestMethod.POST})
	public String empDeptList(String pageNum, Model model) {
		// empList.do 또는 empList.do?pageNum=2
		model.addAttribute("empList", empService.empDeptList(pageNum));
		model.addAttribute("paging", new Paging(empService.totCnt(), pageNum, 10, 5));
		return "empDeptList";
	}
	@RequestMapping(value="detail", method={RequestMethod.GET, RequestMethod.POST})
	public String detail(int empno, Model model) {
		model.addAttribute("empDto", empService.detail(empno));
		return "detail";
	}
	@RequestMapping(value="updateView", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateView(int empno, Model model) {
		model.addAttribute("empDto", empService.detail(empno));
		model.addAttribute("deptList", empService.deptList());
		return "update";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Emp emp, Model model) {
//		empService.update(emp);
//		return "redirect:detail.do";
		try {
			model.addAttribute("modifyResult", empService.update(emp));
		}catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("modifyResult", "필드 값이 너무 길어요. 확인 요망");
			return "forward:updateView.do";
		}
		//return "forward:detail.do";
		return "forward:empDeptList.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int empno, Model model) {
		model.addAttribute("deleteResult", empService.delete(empno));
		return "forward:empDeptList.do";
	}
	@RequestMapping(value="writeView", method= {RequestMethod.GET, RequestMethod.POST})
	public String writeView(Model model) {
		model.addAttribute("managerList", empService.managerList());
		model.addAttribute("deptList", empService.deptList());
		return "write";
	}
}

















