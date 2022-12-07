package com.lec.ex02_protected;
// private i, j / public setI(), getI(), setJ(), getJ()
public class Child extends SuperIJ{
	private int total;
	public Child() {
		System.out.println("매개변수 없는 Child 생성자 함수");
	}
	public Child(int i, int j) {
		System.out.println("매개변수 있는 child 생성자 함수 - i, j초기화");
		//setI(i); 
		this.i = i;
		//setJ(j); 
		this.j = j;
	}
	public void sum() {
		//total = getI() + getJ(); 
		total = i + j;
		System.out.println("i = " + getI()+", j="+getJ() + ", total=" + total);
	}
}












