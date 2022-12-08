package com.lec.quiz;
public class Gangsa extends Person{
	private static int cntGangsa=0;
	private String subject;
	public Gangsa(String id, String name, String subject){
		super(id,name);
		this.subject = subject;
		++cntGangsa;
		setNo("lecturer"+cntGangsa);
	}
	@Override
	public String infoString() {
		return super.infoString()+"\t(과목)"+subject;
	}
	@Override
	public void print() {
		super.print();
		System.out.println("\t(과목)"+subject);
	}
}
