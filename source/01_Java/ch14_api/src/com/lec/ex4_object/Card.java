package com.lec.ex4_object;
// new Card('♥', 6);
public class Card {
	private char kind; // ♥, ◆, ♣, ♠
	private int  num;  // 1 ~ 13
	public Card(char kind, int num) {
		this.kind = kind;
		this.num = num;
	}
	@Override
	public String toString() {
		return "카드 : " + kind + " " + num;  // 카드 : ♥ 5
	}
	@Override
	public boolean equals(Object obj) {
		// card.equals(comCard) => card가 this. comCard가 obj
		// obj가 null이 아니고 obj가 Card타입 객체인지 확인후, kind와 num비교 결과 return 
		
		return super.equals(obj);
	}
}


















