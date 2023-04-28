package com.lec.like.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.like.dao.ClikeDao;
import com.lec.like.vo.Category;
import com.lec.like.vo.Clike;
import com.lec.like.vo.Member;
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
			result += myClike.getCno() + ", ";
		}
		return result;
	}

	@Override
	public int insertLike(Clike clike, HttpSession session, Model model) {
		int result = 0;
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			clike.setMid(member.getMid());
		}
		try {
			result = clikeDao.insertLike(clike);
			model.addAttribute("msg", "관심카테고리 등록에 성공하였습니다");
		} catch (Exception e) {
			model.addAttribute("msg", "관심카테고리 등록에 실패되었습니다");
		}
		return result;
	}

	@Override
	public int deleteLike(Clike clike, HttpSession session, Model model) {
		int result = 0;
		Member member = (Member)session.getAttribute("member");
		if(member!=null) {
			clike.setMid(member.getMid());
		}
		try {
			result = clikeDao.deleteLike(clike);
			model.addAttribute("msg", "관심카테고리 해제에 성공하였습니다");
		} catch (Exception e) {
			model.addAttribute("msg", "관심카테고리 해제에 실패되었습니다");
		}
		return result;
	}
}
