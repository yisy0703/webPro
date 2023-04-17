package com.lec.ch19.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lec.ch19.service.MemberService;
import com.lec.ch19.vo.Member;
@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	// member.do?method=join
	@RequestMapping(params = "method=join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	// member.do?method=idConfirm&mid=aaa
	@RequestMapping(params = "method=idConfirm", method = RequestMethod.GET)
	public String idConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult", memberService.idConfirm(mid));
		return "member/idConfirm";
	}
	@RequestMapping(params = "method=join", method = RequestMethod.POST)
	public String join(@ModelAttribute("mDto") Member member, Model model, HttpSession session) {
		model.addAttribute("joinResult", memberService.joinMember(member, session));
		// return "forword:member.do?method=login";에러
		// return "redirect:member.do?method=login"; // 모델에 add한 joinResult 값이 없어짐
		return "member/login";
	}
	@RequestMapping(params = "method=login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	@RequestMapping(params = "method=login", method = RequestMethod.POST)
	public String login(String mid, String mpw, String after, 
								HttpSession httpSession, Model model) {
		String loginResult = memberService.loginCheck(mid, mpw, httpSession);
		if(loginResult.equals("로그인 성공")) {
			return "redirect:" + after;
		}else {
			model.addAttribute("loginResult", loginResult);
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			return "member/login";
		}
	}
	@RequestMapping(params = "method=logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping(params = "method=modify", method = RequestMethod.GET)
	public String modify() {
		return "member/modify";
	}
	@RequestMapping(value = "modify", method=RequestMethod.GET)
	public String modify1() { // 로그인 후 정보 수정으로 갈 때
		return "member/modify";
	}
	@RequestMapping(params = "method=modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("mDto") Member member, HttpSession httpSession,
							Model model) {
		model.addAttribute("modifyResult", memberService.modifyMember(member, httpSession));
		return "forward:main.do";
	}
}