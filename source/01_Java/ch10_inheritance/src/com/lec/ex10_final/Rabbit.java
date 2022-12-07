package com.lec.ex10_final;
// speed, running(), stop(final)
public final class Rabbit extends Animal { // Rabbit 상속 금지
	@Override
	public void running() {
		speed += 30;
		System.out.println("토끼가 마구 마구 뛰어요. 현재 속도 : " + speed);
	}
}
