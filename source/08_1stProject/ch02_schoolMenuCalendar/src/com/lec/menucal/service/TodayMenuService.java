package com.lec.menucal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.menucal.dao.LunchDao;


public class TodayMenuService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LunchDao lunchDao = LunchDao.getInstance();
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day =  request.getParameter("day");
		String ampm = request.getParameter("ampm");
		request.setAttribute("dto", lunchDao.todayMenu(year, month, day, ampm));
	}
}
