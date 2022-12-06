package com.lec.ex6_final;

import com.lec.constant.Constant;

public class FianlTestMain {
	public static void main(String[] args) {
		// final double PI = 3.141592;
		double r = 3;
		double area = r * r * Constant.PI;
		double round = 2 * Constant.PI * r;
		System.out.println("원의 넓이는 " + area);
		System.out.println("원의 둘레는 " + round);
	}
}
