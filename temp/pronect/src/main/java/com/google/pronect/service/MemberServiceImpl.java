package com.google.pronect.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.dao.MemberDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	String backupPath = "D:\\YeosongYoon\\WebProgramming\\Source\\10_2ndTeamProject\\pronect\\src\\main\\webapp\\memberFile\\";
	
	@Override
	public int idConfirm(String mid) {
		// TODO Auto-generated method stub
		return memberDao.idConfirm(mid);
	}

	@Override
	public int nicknameConfirm(String mnickname) {
		// TODO Auto-generated method stub
		return memberDao.nicknameConfirm(mnickname);
	}

	@Override
	public int joinMember(final Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("memberFile/");
		Iterator<String> params = mRequest.getFileNames();
		String mimage = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		mimage = mFile.getOriginalFilename();
		if(mimage!=null && !mimage.equals("")) { // 첨부함
			if(new File(uploadPath + mimage).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				mimage = System.currentTimeMillis() + "_" + mimage;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + mimage)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + mimage);
				System.out.println("백업파일 : " + backupPath + mimage);
				boolean result = fileCopy(uploadPath + mimage, backupPath + mimage);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			mimage="noprofile.jpg";
		}// if
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:550px; margin: 0 auto;\">\n" + 
					"		<h1>" + member.getMname() + "님의 회원가입 감사합니다</h1>\n" + 
					"		<p>아무데서도 쓸 수 없는 쓰레기 쿠폰을 드리는 척을 하겠습니다</p>\n" + 
					"		<img src=\"data:image/jpeg;base64,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\" width=\"100%\">\n" + 
					"		<hr color=\"red\">\n" + 
					"		<p style=\"color:red;\">빨간 휴지 줄까</p>\n" + 
					"		<p style=\"color:blue;\">파란 휴지 줄까</p>\n" + 
					"		<p><img src=\"http://localhost:8090/ch19/img/coupon.jpg\" alt=\"쓰레기쿠폰\">\n" + 
					"		<p>서울특별시 송파구 방이동</p>\n" + 
					"	</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				// 받을 메일
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
				// 보낼 메일
				mimeMessage.setFrom(new InternetAddress("yse297@gmail.com"));
				// 메일 제목
				mimeMessage.setSubject("[HTML 가입인사]" + member.getMname() + "님 가입 감사합니다");
				// 메일 본문
				mimeMessage.setText(content, "utf-8", "html");
			}
		}; // message 객체 생성
		mailSender.send(message); // 메일 전송
		member.setMimage(mimage);
		httpSession.setAttribute("mid", member.getMid());
		return memberDao.joinMember(member);
	}
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(mid);
		if(member == null) {
			result = "잘못된 아이디나 비밀번호입니다.";
		}else if(! member.getMpw().equals(mpw)) {
			result = "잘못된 아이디나 비밀번호입니다.";
		}else {
			httpSession.setAttribute("member", member);
		}
		return result;
	}

	@Override
	public Member getDetailMember(String mid) {
		// TODO Auto-generated method stub
		return memberDao.getDetailMember(mid);
	}

	@Override
	public int modifyMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("memberFile/");
		Iterator<String> params = mRequest.getFileNames();
		String mimage = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		mimage = mFile.getOriginalFilename();
		if(mimage!=null && !mimage.equals("")) { // 첨부함
			if(new File(uploadPath + mimage).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				mimage = System.currentTimeMillis() + "_" + mimage;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + mimage)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + mimage);
				System.out.println("백업파일 : " + backupPath + mimage);
				boolean result = fileCopy(uploadPath + mimage, backupPath + mimage);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			mimage="noprofile.jpg";
		}// if
		member.setMimage(mimage);
		httpSession.setAttribute("member", member);
		return memberDao.modifyMember(member);
	}

	@Override
	public int modifyManager(Member member) {
		// TODO Auto-generated method stub
		return memberDao.modifyManager(member);
	}

	@Override
	public List<Member> memberList(String pageNum, Member member) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(memberDao.totCntMember(member), pageNum);
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		return memberDao.memberList(member);
	}

	@Override
	public int totCntMember(Member member) {
		// TODO Auto-generated method stub
		return memberDao.totCntMember(member);
	}
	
	@Override
	public int deactivateMember(Member member, HttpSession httpSession) {
		// TODO Auto-generated method stub
		httpSession.setAttribute("member", member);
		return memberDao.deactivateMember(member);
	}
	
	@Override
	public String searchId(String mname, String mmail, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result = "아이디 찾기 요청이 성공하여 회원님의 이메일로 아이디를 발송하였습니다";
		final Member member = memberDao.searchId(mname, mmail);
		if(member == null) {
			result = "이름 혹은 이메일이 일치하지 않습니다";
		}else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<h1>회원 "+ member.getMname() +"님의 아이디는 :   " + member.getMid() + "   입니다.</h1>\n";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// TODO Auto-generated method stub
					// 받을 메일
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
					// 보낼 메일
					mimeMessage.setFrom(new InternetAddress("teamPronect@gmail.com"));
					// 메일 제목
					mimeMessage.setSubject("[proNect 아이디 찾기 요청]");
					// 메일 본문
					mimeMessage.setText(content, "utf-8", "html");
				}
			}; // message 객체 생성
			mailSender.send(message); // 메일 전송
		}
		return result;
	}

	@Override
	public String searchPw(String mname, String mmail, String mid, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String result = "비밀번호 찾기 요청이 성공하여 회원님의 이메일로 비밀번호를 발송하였습니다";
		final Member member = memberDao.searchId(mname, mmail);
		if(member == null) {
			result = "이름 혹은 이메일이 일치하지 않습니다";
		}else {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<h1>회원 "+ member.getMname() +"님의 비밀번호는 :   " + member.getMpw() + "   입니다.</h1><br>"
								+ "<h2>받은 비밀번호로 로그인 하신 후, 비밀번호 이메일 삭제 및 비밀번호 변경을 권장드립니다.</h2>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					// TODO Auto-generated method stub
					// 받을 메일
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMmail()));
					// 보낼 메일
					mimeMessage.setFrom(new InternetAddress("teamPronect@gmail.com"));
					// 메일 제목
					mimeMessage.setSubject("[proNect 비밀번호 찾기 요청]");
					// 메일 본문
					mimeMessage.setText(content, "utf-8", "html");
				}
			}; // message 객체 생성
			mailSender.send(message); // 메일 전송
		}
		return result;
	}
}
