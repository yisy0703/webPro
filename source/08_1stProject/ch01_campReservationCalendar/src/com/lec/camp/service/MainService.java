package com.lec.camp.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.camp.dao.CampGroundDao;
import com.lec.camp.dto.CampGroundDto;

public class MainService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CampGroundDao campDao = CampGroundDao.getInstance();
		ArrayList<CampGroundDto> camps = campDao.listCamp();
		request.setAttribute("camps", camps);
	}

}
