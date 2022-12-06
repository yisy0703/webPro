package com.lec.ex2_parking;

public class ParkingMain {
	public static void main(String[] args) {
		Parking car1 = new Parking("111·ç1111", 6);
		Parking car2 = new Parking("22·ç2222", 8);
		car1.out(8);
		car2.out(9);
		Parking car3 = new Parking("333·ç3333",9);
	}
}
