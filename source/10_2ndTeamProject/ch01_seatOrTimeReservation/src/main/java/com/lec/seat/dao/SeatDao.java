package com.lec.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.seat.vo.Seat;
@Mapper
public interface SeatDao {
	public List<String> seatList(String mid);
	public int seatReservation(Seat seat);
}
