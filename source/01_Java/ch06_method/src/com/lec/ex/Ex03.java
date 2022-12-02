package com.lec.ex;
import com.lec.method.Arithmetic;
public class Ex03 {
	public static void main(String[] args) {
		System.out.println("-9의 절대값 : " + Arithmetic.abs(-9)); //default접근제한자는 같은 패키지만 사용
		Arithmetic ar = new Arithmetic();
		int tot = ar.sum(10);
		System.out.println("합은 : " + tot);
		System.out.println(ar.evenOdd(tot));
		tot = ar.sum(10, 100);
		System.out.println("합은 " + tot);
		System.out.println(ar.evenOdd(tot));
	}
}
