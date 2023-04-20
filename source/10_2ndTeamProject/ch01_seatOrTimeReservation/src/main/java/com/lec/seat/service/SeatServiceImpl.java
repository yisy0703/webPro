package com.lec.seat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.seat.dao.SeatDao;
import com.lec.seat.vo.Seat;
@Service
public class SeatServiceImpl implements SeatService {
	@Autowired
	private SeatDao seatDao;
	@Override
	public List<String> seatList(String mid) {
		// 서비스단에서 할 것 추천
		ArrayList<String> seatDbList = (ArrayList<String>) seatDao.seatList(mid);
		System.out.println("seatDbList : " + seatDbList);
		ArrayList<String> seats = new ArrayList<String>();
		for(int i=0 ; i<10 ; i++) {
			if(seatDbList.contains("a"+(i+1))) {
				//System.out.print("a"+(i+1)+"는 예약됨 ");
				seats.add("a"+i);
			}else {
				//System.out.print("a"+(i+1)+"는 예약안 됨 ");
				seats.add("");
			}
		}
		System.out.println("seats : " + seats);
		return seats;
	}
	@Override
	public boolean seatReservation(String[] seatId, Seat seat) {
		int arrayCnt = seatId.length;
		int reserveCnt = 0;
		for(String seatid : seatId) {
			seat.setSeatid(seatid);
			reserveCnt += seatDao.seatReservation(seat);
		}
		if(arrayCnt == reserveCnt) {
			return true;
		}else {
			return false;
		}
	}

}
