package com.lec.ex2_parking;

public class ParkingMain {
	public static void main(String[] args) {
		Parking car1 = new Parking("111��1111", 6);
		Parking car2 = new Parking("22��2222", 8);
		car1.out(8);
		car2.out(9);
		Parking car3 = new Parking("333��3333",9);
	}
}
