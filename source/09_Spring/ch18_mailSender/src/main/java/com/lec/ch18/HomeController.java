package com.lec.ch18;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class HomeController {
	@Autowired
	private JavaMailSender mailSender;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("회원가입 페이지로");
		return "join";
	}
	@RequestMapping(value="textMail", method = RequestMethod.POST)
	public String textMail(String name, String email, Model model) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("yisy0703@gmail.com"); // 보낼 메일 주소
		message.setTo(email); // 받을 메일 주소
		message.setSubject("[TEXT가입감사]" + name + "님 회원가입 감사합니다"); // 받을 메일 제목
		String content = name + "님 회원가입 감사합니다 \n <h1>태그 안 먹힘</h1>";
		message.setText(content); // 메일 본문 내용
		mailSender.send(message); // 메일 발송
		model.addAttribute("mailSendResult", "TEXT 메일 발송 완료");
		return "sendResult";
	}
}














