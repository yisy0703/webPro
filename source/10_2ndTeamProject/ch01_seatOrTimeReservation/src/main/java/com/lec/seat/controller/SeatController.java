package com.lec.seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.seat.service.SeatService;
import com.lec.seat.vo.Seat;
@Controller
public class SeatController {
	@Autowired
	private SeatService seatService;
	@RequestMapping(value="login")
	public String login() {
		return "login";
	}
	@RequestMapping(value="seatList")
	public String seatReservation(Model model, String mid) {
		model.addAttribute("seats", seatService.seatList(mid));
		return "seatList";
	}
	@RequestMapping(value="seatReservation")
	public String resultReservation(String[] seatId, Seat seat, Model model) {
		model.addAttribute("reserveResult", seatService.seatReservation(seatId, seat));
		return "forward:seatList.do";
	}
}
