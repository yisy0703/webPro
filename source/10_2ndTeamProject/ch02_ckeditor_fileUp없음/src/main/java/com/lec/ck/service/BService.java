package com.lec.ck.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.ck.vo.B;
public interface BService {
	public List<B> listBboard(B b, String pageNum, Model model);
	public void writeBboard(B b, Model model);
	public B detailBboard(int bno);
	public void updateBboard(B b, Model model);
	public int deleteBboard(int bno, Model model);
	public void imageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile);
}
