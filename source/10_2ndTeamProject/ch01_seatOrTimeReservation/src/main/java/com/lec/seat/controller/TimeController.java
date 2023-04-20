package com.lec.seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.seat.service.TimeService;
import com.lec.seat.vo.TimeReservation;

@Controller
public class TimeController {
	@Autowired
	private TimeService timeService;
	@RequestMapping(value="timeReservation", method=RequestMethod.GET)
	public String timeReservation(Model model) {
		model.addAttribute("timeList", timeService.reservationList());
		return "timeReservation";
	}
	@RequestMapping(value="timeReservation", method=RequestMethod.POST)
	public String timeReservation(TimeReservation reservation,  String reservedTimes, String rtimes) {
		boolean reservationResult = timeService.insertReservation(reservation, reservedTimes);
		return "redirect:timeReservation.do?reservationResult="+reservationResult;
	}
}
