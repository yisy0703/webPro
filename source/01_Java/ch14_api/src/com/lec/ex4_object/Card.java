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
		if(obj != null && getClass()==obj.getClass()) { //if(obj!=null && obj instanceof Card) {	
			// kind와 num 비교 결과 return 
			Card other = (Card)obj;
			boolean kindChk = kind == other.kind; // kind.equals(other.kind)
			boolean numChk  = num  == other.num;
			return kindChk && numChk;
		}
		return super.equals(obj);
	}
}


















