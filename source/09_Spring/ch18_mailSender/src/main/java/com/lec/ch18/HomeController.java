package com.lec.ch18;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
	@RequestMapping(value="htmlMail", method = RequestMethod.POST)
	public String htmlMail(final String name, final String email, Model model) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:500px; margin: 0 auto\">\n" + 
					"		<h1>"+name+"님의 회원가입 감사합니다</h1>\n" + 
					"		아무개 사이트에서만 쓰실 수 있는 감사쿠폰을 드립니다<br>\n" + 
					"		<img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\" alt=\"다음 로고\">\n" + 
					"		<hr color=\"red\">\n" + 
					"		<span style=\"color:red;\">빨간 글씨 부분</span><br>\n" + 
					"		<span style=\"color:blue;\">파란 글씨 부분</span><br>\n" + 
					"		<img src=\"http://localhost:8090/ch18/img/coupon.jpg\" alt=\"쿠폰\"><br>\n" + 
					"		<p align=\"center\">서울시 어떤구 몰라17길 51 어떤빌딩 2층</p>\n" + 
					"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
				// 보낼 메일
				mimeMessage.setFrom(new InternetAddress("yisy0703@gmail.com"));
				// 메일 제목
				mimeMessage.setSubject("[HTML 가입인사]" + name + "님 가입 감사합니다");
				// 메일 본문
				mimeMessage.setText(content, "utf-8", "html");
			}
		}; // message 객체 생성
		mailSender.send(message); // 메일 전송
		model.addAttribute("mailSendResult", "HTML 메일 발송 완료");
		return "sendResult";
	}
}














