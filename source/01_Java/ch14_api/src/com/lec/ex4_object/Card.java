package com.lec.ex4_object;
// new Card('��', 6);
public class Card {
	private char kind; // ��, ��, ��, ��
	private int  num;  // 1 ~ 13
	public Card(char kind, int num) {
		this.kind = kind;
		this.num = num;
	}
	@Override
	public String toString() {
		return "ī�� : " + kind + " " + num;  // ī�� : �� 5
	}
	@Override
	public boolean equals(Object obj) {
		// card.equals(comCard) => card�� this. comCard�� obj
		// obj�� null�� �ƴϰ� obj�� CardŸ�� ��ü���� Ȯ����, kind�� num�� ��� return 
		
		return super.equals(obj);
	}
}


















