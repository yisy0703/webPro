package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.google.pronect.vo.Fcomment;

public interface FcommentService {
	public List<Fcomment> fcommentList(int fid, String commentPageNum, Model model);
	public int fcommentTotCnt(int fid);
	public int fcommentWrite(Fcomment fcomment, HttpServletRequest request);
	public int fcommentReply(Fcomment fcomment, HttpServletRequest request);
	public int fcommentModify(Fcomment fcomment);
	public int fcommentDelete(int fcid);
	public Fcomment fcommentContent(int fcid);
}
