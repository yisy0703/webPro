package com.lec.ch09.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.ch09.vo.Student;
@Controller
public class QuizController {
	@ModelAttribute("cnt")
	public int cnt() {
		return 4;
	}
	@RequestMapping(value="input.do", method=RequestMethod.GET)
	public String inputView() {
		return "quiz_student/input";
	}
	@RequestMapping(value="input.do", method=RequestMethod.POST)
	public String inputResult(Student student) {
		student.setSum(student.getKor()+student.getEng()+student.getMat());
		student.setAvg(student.getSum()/3.0);
		return "quiz_student/result";
	}
}
