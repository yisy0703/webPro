package com.lec.ch19.service;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import com.lec.ch19.dao.MemberDao;
import com.lec.ch19.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public int idConfirm(String mid) {
		return memberDao.idConfirm(mid);
	}
	@Override
	public int joinMember(final Member member, HttpSession httpSession) {
		// 메일 전송
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:500px; margin: 0 auto\">\n" + 
					"		<h1>"+ member.getMname() +"님의 회원가입 감사합니다</h1>\n" + 
					"		아무개 사이트에서만 쓰실 수 있는 감사쿠폰을 드립니다<br>\n" + 
					"		<img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\" alt=\"다음 로고\">\n" + 
					"		<hr color=\"red\">\n" + 
					"		<span style=\"color:red;\">빨간 글씨 부분</span><br>\n" + 
					"		<span style=\"color:blue;\">파란 글씨 부분</span><br>\n" + 
					"		<img src=\"http://localhost:8090/ch19_sch/img/coupon.jpg\" alt=\"쿠폰\"><br>\n" + 
					"		<p align=\"center\">서울시 어떤구 몰라17길 51 어떤빌딩 2층</p>\n" + 
					"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// 받을 메일
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
				// 보낼 메일
				mimeMessage.setFrom(new InternetAddress("yisy0703@gmail.com"));
				// 메일 제목
				mimeMessage.setSubject("[HTML 가입인사]" + member.getMname() + "님 가입 감사합니다");
				// 메일 본문
				mimeMessage.setText(content, "utf-8", "html");
			}
		}; // message 객체 생성
		mailSender.send(message); // 메일 전송
		httpSession.setAttribute("mid", member.getMid());
		return memberDao.joinMember(member); // DB 저장
	}
	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(mid);
		if(member == null) {
			result = "유효하지 않은 아이디입니다";
		}else if(! member.getMpw().equals(mpw)) {
			result = "비밀번호가 맞지 않습니다";
		}else {
			httpSession.setAttribute("member", member); 
		}
		return result;
	}
	@Override
	public Member getDetailMember(String mid) {
		return memberDao.getDetailMember(mid);
	}
	@Override
	public int modifyMember(Member member, HttpSession httpSession) {
		httpSession.setAttribute("member", member);
		return memberDao.modifyMember(member);
	}
}