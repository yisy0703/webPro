package com.lec.cb.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.cb.dao.BoardDao;
import com.lec.cb.util.Paging;
import com.lec.cb.vo.Board;
import com.lec.cb.vo.Comment;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	@Override
	public List<Board> boardList(String pageNum, Model model) {
		Paging paging = new Paging(boardDao.boardTotCnt(), pageNum);
		Board board = new Board();
		board.setStartRow(paging.getStartRow());
		board.setEndRow(paging.getEndRow());
		List<Board> list = boardDao.boardList(board);
		model.addAttribute("paging", paging);
		return list;
	}
	@Override
	public int boardTotCnt() {
		return boardDao.boardTotCnt();
	}
	@Override
	public int boardWrite(Board board, HttpServletRequest request) {
		board.setBip(request.getRemoteAddr());
		return boardDao.boardWrite(board);
	}
	@Override
	public Board boardContent(int bid) {
		boardDao.boardHitUp(bid);
		return boardDao.boardDetail(bid);
	}
	public Board boardModifyReplyView(int bid) {
		return boardDao.boardDetail(bid);
	}
	@Override
	public int boardReply(Board board, HttpServletRequest request) {
		board.setBip(request.getRemoteAddr());
		boardDao.boardReplyPreStep(board);
		return boardDao.boardReply(board);
	}
	@Override
	public int boardModify(Board board, HttpServletRequest request) {
		board.setBip(request.getRemoteAddr());
		return boardDao.boardModify(board);
	}
	@Override
	public int boardDelete(int bid) {
		return boardDao.boardDelete(bid);
	}
	@Override
	public void dummy() {
		Board board = new Board();
		String[] names = {"홍길동","김성실","이순신","성춘향","변사또","이몽룡","윤봉길","김구","이봉창","유관순"};
		for(int i=1 ; i<100 ; i++) {
			board.setBname(names[i%10]);
			board.setBtitle("제목임다 " + i);
			board.setBcontent("본문임다 " + i);
			board.setBip("190.168.0."+i);
			boardDao.boardWrite(board);
		}
	}
}