package strategy3quiz.modularization;

import strategy3quiz.interfaces.GetSalary;
import strategy3quiz.interfaces.JobMng;

public class Staff extends Person {
	private String part;
	public Staff(String id, String name, String part) {
		super(id, name);
		this.part = part;
		setJob(new JobMng());
		setGet(new GetSalary());
	}
	@Override
	public void print() {
		super.print();
		System.out.println("\t[ºÎ¼­]"+part);
	}
}
