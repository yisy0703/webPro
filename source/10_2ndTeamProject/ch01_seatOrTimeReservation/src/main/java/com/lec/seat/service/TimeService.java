package com.lec.seat.service;

import java.util.List;

import com.lec.seat.vo.TimeReservation;

public interface TimeService {
	public List<TimeReservation> reservationList();
	public boolean insertReservation(TimeReservation reservation, String reservedTimes);
}
