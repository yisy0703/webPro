package com.lec.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.ex.dao.BoardDao;
import com.lec.ex.dto.BoardDto;
public class BoardContentService implements Service {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fid = Integer.parseInt(request.getParameter("fid"));
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto board = boardDao.contentBoard(fid);
		request.setAttribute("board", board);
	}
}