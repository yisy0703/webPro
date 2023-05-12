package com.lec.ch04_member.controller;

import com.lec.ch04_member.model.Member;
import com.lec.ch04_member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping(value="/")
    public String home(Model model){
        model.addAttribute("greeting", "첫화면입니다. 반갑습니다");
        return "home";
    }
    @GetMapping("/join")
    public String joinView(){
        return "member/join";
    }
    @PostMapping("/join")
    public String join(Member member) {
        memberService.join(member);
        return "redirect:/list";
    }
    @GetMapping(value = "list")
    public String list(Model model){
        model.addAttribute("memberList", memberService.findMembers());
        return "member/list";
    }
    @GetMapping(value="findOne")
    public String findOne(int no, Model model){
        model.addAttribute("member", memberService.findOne(no).get());
        return "member/findOne";
    }
}
