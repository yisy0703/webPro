package com.lec.ex4_object;
public class Person {
	private long juminNo; //9812122512541
	public Person() {}
	public Person(long juminNo) {
		this.juminNo = juminNo;
	}
	@Override
	public String toString() {
		return "�ֹι�ȣ�� " + juminNo;
	}
	@Override
	public boolean equals(Object obj) {
		// p1.equals(p2) : p1�� this. p2�� obj
		// this�� �ֹι�ȣ�� obj�� �ֹι�ȣ�� ������ �ٸ��� ���θ� return
		if(obj!=null && obj instanceof Person) {
			return juminNo == ((Person)obj).juminNo;
		}else {
			return false;
		}
	}
}














