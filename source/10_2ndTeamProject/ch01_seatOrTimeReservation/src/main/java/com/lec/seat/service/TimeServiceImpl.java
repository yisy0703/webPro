package com.lec.seat.service;

import java.sql.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.seat.dao.TimeDao;
import com.lec.seat.vo.TimeReservation;
@Service
public class TimeServiceImpl implements TimeService {
	@Autowired
	private TimeDao timeDao;
	@Override
	public List<TimeReservation> reservationList() {
		// TODO Auto-generated method stub
		return timeDao.reservationList();
	}

	@Override
	public boolean insertReservation(TimeReservation reservation, String reservedTimes) {
		StringTokenizer tokenizer = new StringTokenizer(reservedTimes);
		int timeCnt = tokenizer.countTokens();
		int insertCnt = 0;
		while(tokenizer.hasMoreTokens()) {
			reservation.setRtime(Integer.parseInt(tokenizer.nextToken()));
			insertCnt += timeDao.insertReservation(reservation);
		}
		if(timeCnt==insertCnt) {
			return true;
		}else {
			return false;
		}
	}

}
