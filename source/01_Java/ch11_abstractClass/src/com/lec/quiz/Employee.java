package com.lec.quiz;
public abstract class Employee {
	private String name;
	public Employee(String name) {
		this.name = name; 
	}
	public abstract int computePay(); // 월급
	public final int computeIncentive(){ // 인센티브
		int temp = computePay();
		if (temp>=3000000) 
			return (int)(temp*0.05);
		return 0;
		//return temp>=3000000 ? (int)(temp*0.05) : 0;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
