package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.Qboard;

public interface QboardService {
	public List<Qboard> qboardList(Qboard qboard, String pageNum);
	public int totCntQboard(Qboard qboard);
	public int writeQboard(Qboard qboard, MultipartHttpServletRequest mRequest, HttpServletRequest request);
	public Qboard contentQboard(int qid);
	public int modifyQboard(Qboard qboard, MultipartHttpServletRequest mRequest);
	public int deleteQboard(int qid);
	public int replyQboard(Qboard qboard, MultipartHttpServletRequest mRequest);
}
