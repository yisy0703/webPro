package com.lec.ex;
// 형변환
public class VarEx06 {
	public static void main(String[] args) {
		int i = 10;
		double d = i; // d = 10.0 묵시적인 형변환
		System.out.println("d = " + d);
		i = (int)10.6; // 명시적인 형변환 - 데이터 손실이 생길 수 있다
		System.out.println("i = " + i);
	}
}
