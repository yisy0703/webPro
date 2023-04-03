package com.lec.ch02.ex2_bmi;
import java.util.ArrayList;
import lombok.Data;
@Data
public class MyInfo {
	private String name;
	private double height;
	private double weight;
	private ArrayList<String> hobby;
	private BMICalculator bmiCalculator;
	public void infoPrint() {
		System.out.println("이름 : " + name);
		System.out.println("키 : " + height);
		System.out.println("체중 : " + weight);
		System.out.println("취미 : " + hobby);
		bmiCalculator.bmiCalculation(weight, height);
		System.out.println("-----------------------------");
	}
}





