package com.lec.ch17.service;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.lec.ch17.vo.Board;
public interface BoardService {
	public List<Board> boardList(String pageNum);
	public int boardTotCnt();
	public int boardWrite(Board board, HttpServletRequest request);
	public Board boardContent(int bid); // 상세보기
	public Board boardModifyReplyView(int bid); // 수정view, 답변글 view
	public int boardModify(Board board, HttpServletRequest request);
	public int boardDelete(int bid);
	public int boardReply(Board board, HttpServletRequest request);
	public void insert60();
}
