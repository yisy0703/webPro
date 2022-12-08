package com.lec.ex1_store;
// 2È£Á¡ : ºÎ´ëÂî°³-5,000  ºñºö¹ä-5,000 °ø±â¹ä ¹«·á
public class Store2 extends HeadQuarterStore {
	public Store2(String storeName) {
		super(storeName);
	}
	@Override
	public void bude() {
		System.out.println("ºÎ´ëÂî°³ : 5,000¿ø");
	}
	@Override
	public void bibim() {
		System.out.println("ºñºö¹ä : 5,000¿ø");
	}
	@Override
	public void gongibab() {
		System.out.println("°ø±â¹ä : ¹«·á");
	}
}
