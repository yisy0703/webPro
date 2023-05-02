package com.google.pronect.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.service.MemberService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Member;

@Controller
@RequestMapping(value = "member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	@RequestMapping(value = "idConfirm", method = RequestMethod.GET)
	public String idConfirm(String mid, Model model) {
		model.addAttribute("idConfirmResult", memberService.idConfirm(mid));
		return "member/idConfirm";
	}
	@RequestMapping(value = "nicknameConfirm", method = RequestMethod.GET)
	public String nicknameConfirm(String mnickname, Model model) {
		model.addAttribute("nicknameConfirmResult", memberService.nicknameConfirm(mnickname));
		return "member/nicknameConfirm";
	}
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("mDto") Member member, Model model, 
			HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		model.addAttribute("joinResult", memberService.joinMember(member, httpSession, mRequest));
		return "member/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String mid, String mpw, HttpSession httpSession, Model model ) {
		String loginResult = memberService.loginCheck(mid, mpw, httpSession);
		if(loginResult.equals("로그인 성공")) {
			model.addAttribute("loginResult", loginResult);
			return "forward:/main.do";
		}else {
			model.addAttribute("loginResult", loginResult);
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			return "member/login";
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "main/main";
	}
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage() {
		return "member/myPage";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify() {
		return "member/modify";
	}
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("mDto") Member member, 
			Model model, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		model.addAttribute("modifyResult", memberService.modifyMember(member, httpSession, mRequest));
		return "main/main";
	}
	@RequestMapping(value = "deactivate", method = RequestMethod.GET)
	public String deactivate() {
		return "member/deactivate";
	}
	@RequestMapping(value = "deactivate", method = RequestMethod.POST)
	public String deactivate(@ModelAttribute("mDto") Member member, Model model, HttpSession httpSession) {
		model.addAttribute("deactivateResult", memberService.deactivateMember(member, httpSession));
		httpSession.invalidate();
		return "main/main";
	}
	@RequestMapping(value = "searchId", method = RequestMethod.GET)
	public String searchId() {
		return "member/searchId";
	}
	@RequestMapping(value = "searchId", method = RequestMethod.POST)
	public String searchId(String mname, String mmail, Model model, HttpSession httpSession) {
		model.addAttribute("searchIdResult", memberService.searchId(mname, mmail, httpSession));
		return "member/login";
	}
	@RequestMapping(value = "searchPw", method = RequestMethod.GET)
	public String searchPw() {
		return "member/searchPw";
	}
	@RequestMapping(value = "searchPw", method = RequestMethod.POST)
	public String searchPw(String mname, String mmail, String mid, Model model, HttpSession httpSession) {
		model.addAttribute("searchPwResult", memberService.searchPw(mname, mmail, mid, httpSession));
		return "member/login";
	}
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberList(String pageNum, Member member, Model model) {
		model.addAttribute("memberList", memberService.memberList(pageNum, member));
		model.addAttribute("paging", new Paging(memberService.totCntMember(member), pageNum));
		return "member/list";
	}
	@RequestMapping(value = "modifyManager", method = RequestMethod.GET)
	public String managerModify(String mid, Model model) {
		model.addAttribute("memberDto", memberService.getDetailMember(mid));
		return "member/modifyManager";
	}
	@RequestMapping(value = "modifyManager", method = RequestMethod.POST)
	public String managerModify(@ModelAttribute("mDto")Member member, Model model, String pageNum) {
		model.addAttribute("modifyManagerResult", memberService.modifyManager(member));
		return "forward:list.do";
	}
}
