package com.tj.ck.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.ck.dto.B;
import com.tj.ck.dto.FileUpVO;

public interface BService {
	public List<B> list(B b, String pageNum, Model model);
	public int write(MultipartHttpServletRequest mRequest, B b, Model model);
	public B detail(int bno);
	public int update(MultipartHttpServletRequest mRequest, Model model);
	public int delete(int bno, Model model);
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request);
}
