package com.lec.ex5_car;
// LowGradeCar low = new LowGradeCar("빨강", "일반타이어", 1000, "파워핸들");
// low.getSpec();
public class LowGradeCar extends Car {
	private int tax;
	public LowGradeCar(String color, String tire, int displacement, String handle) {
		super(color, tire, displacement, handle);
		tax = 0;
	}
	@Override
	public void getSpec() { // tax를 포함한 Spec들 출력
		if(getDisplacement() > 900) {
			tax += (getDisplacement() - 900) * 500;
			//tax = tax + (getDisplacement()-900) * 500;
		}
		System.out.println("색  상 : " + getColor());
		System.out.println("타이어 : " + getTire());
		System.out.println("배기량 : " + getDisplacement());
		System.out.println("핸  들  : " + getHandle());
		System.out.println("세  금  : " + tax);
		System.out.println("==============================");
	}
}








