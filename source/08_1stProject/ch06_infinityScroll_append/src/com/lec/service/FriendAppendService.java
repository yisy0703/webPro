package com.lec.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.FriendDao;
import com.lec.dto.FriendDto;

public class FriendAppendService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow   = startRow + PAGESIZE - 1;
		FriendDao dao = new FriendDao();
		int totCnt = dao.getFrindTotCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);//페이지갯수
		System.out.println(pageCnt + "페이지 중 현재 " + currentPage);
		if(currentPage <= pageCnt) {
			ArrayList<FriendDto> friendList = dao.getFriendList(startRow, endRow);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("friendList", friendList);
			request.setAttribute("pageNum", currentPage);// pageNum 없으면 param.pageNum
		}else {
			request.setAttribute("error", "더 이상 출력할 친구가 없습니다");
		}
	}

}
