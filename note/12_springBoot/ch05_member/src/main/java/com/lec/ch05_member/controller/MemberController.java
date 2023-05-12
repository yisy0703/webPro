package com.lec.ch05_member.controller;
import com.lec.ch05_member.model.Member;
import com.lec.ch05_member.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
@Controller
@Slf4j
public class MemberController {
    private MemberService memberService;
    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }
    @GetMapping(value="/")
    public String home(Model model){
        log.info("웹 프로젝트 시작");
        model.addAttribute("greeting", "첫화면입니다. 반갑습니다");
        return "home";
    }
    @GetMapping("/join")
    public String joinView(){
        return "member/join";
    }
    @PostMapping("/join")
    public String join(Member member) throws UnsupportedEncodingException {
        try {
            memberService.join(member);
        }catch (IllegalStateException e){
            System.out.println(e.getMessage());
            String msg = URLEncoder.encode("중복된 이름은 등록 불가합니다","utf-8");
            return "redirect:join?msg="+msg;
        }
        return "redirect:/";
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
