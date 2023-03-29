package com.lec.camp.service;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.camp.dao.CampGroundDao;
import com.lec.camp.dao.ReservationDao;
import com.lec.camp.dto.CampGroundDto;
import com.lec.camp.dto.ReservationDto;
import com.lec.camp.util.CalendarPrinter;

public class CampReservationList implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		String yearParam = request.getParameter("year");
		String monthParam = request.getParameter("month");
		int year,  month;
		if(yearParam==null && monthParam==null) {
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH)+1;
			yearParam = String.valueOf(year);
			monthParam = month<10 ? "0"+month : String.valueOf(month);
		}else {
			year = Integer.parseInt(yearParam);
			month = Integer.parseInt(monthParam);
			monthParam = month<10 ? "0"+month : String.valueOf(month);
		}
		CalendarPrinter calPrint = new CalendarPrinter(year, month);
		ReservationDao reservationDao = ReservationDao.getInstance();
		ArrayList<ReservationDto> reservations = reservationDao.getReservation(cno, yearParam, monthParam);
		System.out.println(yearParam+"년 " + monthParam + "월 예약들\n" +reservations);
		CampGroundDao campGroundDao = CampGroundDao.getInstance();
		CampGroundDto camp = campGroundDao.getCamp(cno);
		request.setAttribute("reservations", reservations);
		request.setAttribute("calPrint", calPrint);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("camp", camp);
	}

}
