package com.lec.ex2;
// ctrl + shift + o : 불필요한 import 제거
import com.lec.ex2_human.*;
import com.lec.ex2_human.kid.Kid;
public class HumanMain {
	public static void main(String[] args) {
		Woman woman1    =  new Woman();
		Woman woman2    =  new Woman();
//      ------------       ------------------
//  레퍼런스변수(객체변수) 선언    객체생성(인스턴스 생성)
		// System.out.println("woman1과 woman2가 같은지 : " + (woman1 == woman2));
		System.out.println("woman1과 woman2가 같은지 : " + woman1.equals(woman2));
		Man man = new Man();
		Kid kid1 = new Kid("홍아기");
		// Kid kid2 = new Kid(); 개발자가 생성자 함수를 만들면 디폴트 생성자 함수는 자동 생성 안 함
		
	}
}












