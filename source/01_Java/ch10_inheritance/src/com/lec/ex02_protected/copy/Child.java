package com.lec.ex02_protected.copy;
// private i, j / public setI(), getI(), setJ(), getJ()
public class Child extends SuperIJ{
	private int total;
	public Child() {
		super();
		System.out.println("�Ű����� ���� Child ������ �Լ�");
	}
	public Child(int i, int j) {  // ���� ���� : super�̿�
		super(i, j);
		System.out.println("�Ű����� �ִ� child ������ �Լ� - i, j�ʱ�ȭ");
//		//setI(i); 
//		this.i = i;
//		//setJ(j); 
//		this.j = j;
	}
	public void sum() {
		//total = getI() + getJ(); 
		total = i + j;
		System.out.println("i = " + getI()+", j="+getJ() + ", total=" + total);
	}
}












