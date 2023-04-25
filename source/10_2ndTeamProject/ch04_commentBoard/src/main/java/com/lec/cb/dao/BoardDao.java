package com.lec.cb.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.lec.cb.vo.Board;
@Mapper
public interface BoardDao {
	public List<Board> boardList(Board board);
	public int boardTotCnt();
	public int boardWrite(Board board);
	public int boardHitUp(int bid);
	public Board boardDetail(int bid);
	public int boardReplyPreStep(Board board);
	public int boardReply(Board board);
	public int boardModify(Board board);
	public int boardDelete(int bid);
}
