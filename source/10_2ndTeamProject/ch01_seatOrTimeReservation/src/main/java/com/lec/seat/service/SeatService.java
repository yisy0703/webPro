package com.lec.seat.service;

import java.util.List;

import com.lec.seat.vo.Seat;

public interface SeatService {
	public List<String> seatList(String mid);
	public boolean seatReservation(String[] seatId, Seat seat);
}
