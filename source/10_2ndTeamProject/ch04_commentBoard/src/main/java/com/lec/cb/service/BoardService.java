package com.lec.cb.service;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lec.cb.vo.Board;
public interface BoardService {
	public List<Board> boardList(String pageNum, Model model);
	public int boardTotCnt();
	public int boardWrite(Board board, HttpServletRequest request);
	public Board boardContent(int bid);
	public Board boardModifyReplyView(int bid);
	public int boardReply(Board board, HttpServletRequest request);
	public int boardModify(Board board, HttpServletRequest request);
	public int boardDelete(int bid);
	public void dummy();
}
