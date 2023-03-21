package com.lec.camp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.camp.dao.ReservationDao;

public class CampReservation implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String reservationDate = request.getParameter("reservationDate");
		String mid =  request.getParameter("mid");
		int cno = Integer.parseInt(request.getParameter("cno"));
		ReservationDao reservationDao = ReservationDao.getInstance();
		int reservationResult = reservationDao.reservationCamp(mid, cno, reservationDate);
		request.setAttribute("reservationResult", reservationResult);
	}

}
