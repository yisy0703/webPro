package com.tj.test06.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tj.test06.dao.ClikeDao;
import com.tj.test06.dto.Category;
import com.tj.test06.dto.Clike;
import com.tj.test06.dto.Member;
@Service
public class ClikeServiceImpl implements ClikeService {
	@Autowired
	private ClikeDao clikeDao;
	@Override
	public List<Category> categoryList() {
		return clikeDao.categoryList();
	}

	@Override
	public String myClikeList(HttpSession session) {
		String mid = "";
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			mid = member.getMid();
		}
		List<Clike> myClikeList = clikeDao.myClikeList(mid);
		String result = "";
		for(Clike myClike : myClikeList) {
			result += myClike.getCno() +", ";
		}
		return result;
	}
	@Override
	public int myClikeInsert(Clike clike, HttpSession session, Model model) {
		int result = 0;
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			clike.setMid(member.getMid());
		}
		try {
			System.out.println("관심 등록 전 clike : "+clike);
			result = clikeDao.myClikeInsert(clike);
			model.addAttribute("msg", "관심카테고리 등록에 성공하였습니다");
		} catch (Exception e) {
			model.addAttribute("msg", "관심카테고리 등록에 실패되었습니다");
		}
		return result;
	}

	@Override
	public int myClikeDelete(Clike clike, HttpSession session, Model model) {
		int result = 0;
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			clike.setMid(member.getMid());
		}
		try {
			System.out.println("관심 해제전 clike : "+clike);
			result = clikeDao.myClikeDelete(clike);
			model.addAttribute("msg", "관심카테고리 해제에 성공하였습니다");
		} catch (Exception e) {
			model.addAttribute("msg", "관심카테고리 해제에 실패되었습니다");
		}
		return result;
	}
}
