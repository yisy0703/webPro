package com.lec.quiz;

public class Staff extends Person {
	private static int cntStaff=0;
	private String department;
	public Staff(String id, String name, String department){
		super(id,name);
		this.department = department;
		++cntStaff;
		setNo("staff"+cntStaff);
	}
	@Override
	public String infoString() {
		return super.infoString()+"\t(부서)"+department;
	}
	@Override
	public void print() {
		super.print();
		System.out.println("\t(부서)"+department);
	}
}
