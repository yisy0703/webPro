package com.lec.sn.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.sn.vo.Board;
public interface BoardService {
	public List<Board> list();
	public void write(Board board, MultipartHttpServletRequest mRequest, Model model);
	public Board detail(int bNo);
	public void update(Board board, MultipartHttpServletRequest mRequest, Model model);
	public void delete(int bNo, Model model);
	public int getCnt();
}
