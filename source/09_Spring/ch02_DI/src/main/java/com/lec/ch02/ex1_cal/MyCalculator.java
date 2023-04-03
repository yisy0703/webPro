package com.lec.ch02.ex1_cal;
import lombok.Data;
// Main은 MyCalculator를 의존. MyCalculator는 Calculator를 의존
@Data
public class MyCalculator {
	private Calculator calculator;
	private int num1;
	private int num2;
	public void add() {
		calculator.addition(num1, num2);
	}
	public void sub() {
		calculator.subtraction(num1, num2);
	}
	public void mul() {
		calculator.multiplication(num1, num2);
	}
	public void div() {
		calculator.division(num1, num2);
	}
}
