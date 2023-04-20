package com.lec.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.seat.vo.TimeReservation;

@Mapper
public interface TimeDao {
	public List<TimeReservation> reservationList();
	public int insertReservation(TimeReservation timeReservation);
}
