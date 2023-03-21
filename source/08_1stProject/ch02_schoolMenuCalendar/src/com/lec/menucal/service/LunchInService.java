package com.lec.menucal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.menucal.dao.LunchDao;

public class LunchInService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LunchDao lunchDao = LunchDao.getInstance();

	}

}
