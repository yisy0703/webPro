package com.lec.ex1_store;
// 추상클래스 : 하나 이상의 추상메소드를 갖고 있으면 추상클래스
public abstract class HeadQuarterStore {
	private String storeName;
	public HeadQuarterStore(String storeName) {
		this.storeName = storeName;
	}
	// 추상메소드 : 나를 상속한 클래스에서 반드시 override 해라.
	//           메소드의 선언만 있을 뿐, 구현은 없다
	public abstract void kimchi(); 
	public abstract void bude();
	public abstract void bibim();
	public abstract void sunde();
	public abstract void gongibab();
	public String getStoreName() {return storeName;}
}
