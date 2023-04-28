package com.lec.infinity.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.infinity.vo.Memo;

public interface MemoService {
	public void memoInsert(Memo memo, Model model, HttpServletRequest request);
	public void memoList(String pageNum, Model model);
	public void insert100();
}
