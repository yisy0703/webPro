package com.lec.ch17.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.ch17.vo.Board;

@Mapper
public interface BoardDao {
	public List<Board> boardList(Board board);
	public int boardTotCnt();
	public int boardWrite(Board board);
	public void boardHitUp(int bid);
	public Board getBoardDto(int bid);
	public int boardUpdate(Board board);
	public int boardDelete(int bid);
	public void boardReplyPreStep(Board board);
	public int boardReply(Board board);
}
