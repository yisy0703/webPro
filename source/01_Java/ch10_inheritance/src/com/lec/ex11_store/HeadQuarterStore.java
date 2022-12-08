package com.lec.ex11_store;
//º»»ç ÁöÄ§  : ±èÄ¡Âî°³-5,000  ºÎ´ëÂî°³-6,000  ºñºö¹ä-6,000 ¼ø´ë±¹-5,000  °ø±â¹ä-1,000¿ø
// HeadQuarterStore head = new HeadQuarterStore("= = º»»ç = =");
public class HeadQuarterStore {
	private String storeName;
	public HeadQuarterStore(String storeName) {
		this.storeName = storeName;
	}
	public void kimchi() {
		System.out.println("±èÄ¡Âî°³ : 5,000¿ø");
	}
	public void bude() {
		System.out.println("ºÎ´ëÂî°³ : 6,000¿ø");
	}
	public void bibim() {
		System.out.println("ºñºö¹ä : 6,000¿ø");
	}
	public void sunde() {
		System.out.println("¼ø´ë±¹ : 5,000¿ø");
	}
	public void gongibab() {
		System.out.println("°ø±â¹ä : 1,000¿ø");
	}
	public String getStoreName() {return storeName;}
}
