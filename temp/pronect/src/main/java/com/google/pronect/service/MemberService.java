package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.Member;

public interface MemberService {
	public int idConfirm(String mid);
	public int nicknameConfirm(String mnickname);
	public int joinMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest);
	public String loginCheck(String mid, String mpw, HttpSession httpSession);
	public Member getDetailMember(String mid);
	public int modifyMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest);
	public int modifyManager(Member member);
	public List<Member> memberList(String pageNum, Member member);
	public int totCntMember(Member member);
	public int deactivateMember(Member member, HttpSession httpSession);
	public String searchId(String mname, String mmail, HttpSession httpSession);
	public String searchPw(String mname, String mmail, String mid, HttpSession httpSession);
}
