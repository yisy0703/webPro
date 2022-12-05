package com.lec.ex2_human;
//Man kim = new Man();
//Man kim = new Man("홍길동");
// Man kim = new Man("홍길동", 22, 170, 65);
public class Man {
	private String name;
	private int age;
	private int height;
	private double weight;
	// 개발자가 생성자 함수를 만들면 컴파일러는 디폴트 생성자 함수를 안 만들어
	public Man() {
		System.out.println("매개변수 없는 생성자 함수");
	}
	public Man(String name, int age, int height, double weight) {
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		System.out.println("데이터 4개 초기화하는 생성자 함수");
	}
	// new Man("홍길동")  new Man(170)  new Man(65.5)
	public Man(String name) {
		this.name = name;
		System.out.println("이름 초기화하는 생성자 함수");
	}
	public Man(int height) {
		this.height = height;
	}
	public Man(double weight) {
		this.weight = weight;
	}
	public double calculateBMI() { // 객체안의 height와 weight로 BMI 지수 return
		double result = weight / ( (height*0.01) * (height*0.01) );
		return result;
	}
	// getter : name, age, height, weight
	
	// setter : name, age, height, weight
}
















