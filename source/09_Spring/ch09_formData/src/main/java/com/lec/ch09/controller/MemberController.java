package com.lec.ch09.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.ch09.vo.MemberDto;
@Controller
@RequestMapping("member") // 공통요청경로
public class MemberController {
	// 모든 요청 경로의 jsp 페이지에 출력할 것
	@ModelAttribute("cnt")
	public int cnt() {
		return 4;
	}
	@ModelAttribute("list")
	public ArrayList<String> list(){
		ArrayList<String> list = new ArrayList<String>();
		list.add("test1"); list.add("test2");
		return list;
	}
	@RequestMapping(value="join1", method=RequestMethod.GET)
	public String join1(HttpServletRequest request, Model model) { 
		String name = request.getParameter("name");
		String id   = request.getParameter("id");
		String pw   = request.getParameter("pw");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("age", age);
		model.addAttribute("email", email);
		model.addAttribute("address", address);
		return "member/result1";
	}
	@RequestMapping(value="join2", method=RequestMethod.GET)
	public String join2(@RequestParam("name") String memberName, 
			@RequestParam("id") String memberId,
			@RequestParam("pw") String memberPw,
			@RequestParam("age") int memberAge,
			@RequestParam("email") String memberEmail,
			@RequestParam("address") String memberAddress, Model model) {
		model.addAttribute("name", memberName);
		model.addAttribute("id", memberId);
		model.addAttribute("pw", memberPw);
		model.addAttribute("age", memberAge);
		model.addAttribute("email", memberEmail);
		model.addAttribute("address", memberAddress);
		return "member/result1";
	}
	@RequestMapping(value="join3", method=RequestMethod.GET)
	public String join3(String name, String id, String pw, int age, 
			String email, String address, Model model) { 
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("age", age);
		model.addAttribute("email", email);
		model.addAttribute("address", address);
		return "member/result1";
	}
//	@RequestMapping(value="join4", method=RequestMethod.GET)
//	public String join4(String name, String id, String pw, int age, 
//			String email, String address, Model model) {
//		MemberDto member = new MemberDto();
//		member.setName(name);
//		member.setId(id);
//		member.setPw(pw);
//		member.setAge(age);
//		member.setEmail(email);
//		member.setAddress(address);
//		model.addAttribute("member", member);
//		return "member/result4";
//	}
	@RequestMapping(value="join4", method=RequestMethod.GET)
	public String join4(MemberDto memberDto, // 매개변수없는생성자함수와 setter필요 
						Model model) { 
		model.addAttribute("member", memberDto);
		return "member/result4";
	}
	@RequestMapping(value="join5")
	public String join5(MemberDto memberDto) { 
		return "member/result5";
	}
	@RequestMapping(value="join6")
	public String join6(@ModelAttribute("member") MemberDto memberDto) {
		return "member/result4";
	}
}