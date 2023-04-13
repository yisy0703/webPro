package com.lec.ch17.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.ch17.dao.BoardDao;
import com.lec.ch17.util.Paging;
import com.lec.ch17.vo.Board;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	@Override
	public List<Board> boardList(String pageNum) {
		Paging paging = new Paging(boardDao.boardTotCnt(), pageNum);
		Board board = new Board();
		board.setStartRow(paging.getStartRow());
		board.setEndRow(paging.getEndRow());
		return boardDao.boardList(board);
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
		return boardDao.getBoardDto(bid);
	}
	@Override
	public Board boardModifyReplyView(int bid) {
		return boardDao.getBoardDto(bid);
	}
	@Override
	public int boardModify(Board board, HttpServletRequest request) {
		board.setBip(request.getRemoteAddr());
		return boardDao.boardUpdate(board);
	}
	@Override
	public int boardDelete(int bid) {
		return boardDao.boardDelete(bid);
	}
	@Override
	public int boardReply(Board board, HttpServletRequest request) {
		boardDao.boardReplyPreStep(board);
		board.setBip(request.getRemoteAddr());
		return boardDao.boardReply(board);
	}
	@Override
	public void insert60() {
		Board bDto = new Board();
		for(int i=1 ; i<60 ; i++){
			if(i%3==0){
				bDto.setBname("홍길동");
			}else if(i%3 == 1){
				bDto.setBname("심방탄");
			}else {
				bDto.setBname("이순신");
			}
			bDto.setBtitle("제목"+i+"입니다");
			bDto.setBcontent("본문"+i);
			bDto.setBip("192.168.0."+i);
			int result = boardDao.boardWrite(bDto);
			System.out.println(result==1 ? i+"번째 성공":i+"번째 실패");
		}
	}
}
