package com.lec.ch02.ex2_bmi;
import lombok.Data;
@Data
public class BMICalculator {
	private double lowWeight; // 저체중 bmi 지수 기준점
	private double normal ; // 정상체중 bmi 지수 기준점
	private double overWeight; // 과체중 기준점
	private double obesity;    // 비만 기준점
	public void bmiCalculation(double weight, double height) {
		// 60, 175.1 => 60/(1.751*1.75)
		double h = height*0.01;
		double result = weight / (h * h);
		if(result <= lowWeight) {
			System.out.println("저체중입니다");
		}else if(result < normal) {
			System.out.println("정상체중입니다");
		}else if(result < overWeight) {
			System.out.println("과체중입니다");
		}else if(result < obesity) {
			System.out.println("1단계 비만입니다");
		}else {
			System.out.println("2단계 비만입니다");
		}
	}
}










