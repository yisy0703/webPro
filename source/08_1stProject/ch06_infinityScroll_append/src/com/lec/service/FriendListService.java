package com.lec.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.FriendDao;
import com.lec.dto.FriendDto;

public class FriendListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
//		String requestPageNum = (String)request.getAttribute("pageNum");
		if(pageNum==null) {
//			if(requestPageNum==null)
				pageNum = "1";
//			else
//				pageNum = requestPageNum;
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow   = startRow + PAGESIZE - 1;
		FriendDao dao = new FriendDao();
		int totCnt = dao.getFrindTotCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);//페이지갯수
		ArrayList<FriendDto> friendList = dao.getFriendList(startRow, endRow);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("friendList", friendList);
	}

}
