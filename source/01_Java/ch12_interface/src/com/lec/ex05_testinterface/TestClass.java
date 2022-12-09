package com.lec.ex05_testinterface;
// i1, i2, i3, m1(), m2(), m3()
public class TestClass implements I3 {
	@Override
	public void m1() {
		System.out.println("상수 i1=" + i1);
	}
	@Override
	public void m2() {
		System.out.println("상수 i2="+i2);
	}
	@Override
	public void m3() {
		System.out.println("상수 i3="+i3);
	}
}





