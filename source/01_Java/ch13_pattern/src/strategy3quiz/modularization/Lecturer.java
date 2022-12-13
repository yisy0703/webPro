package strategy3quiz.modularization;

import strategy3quiz.interfaces.GetSalary;
import strategy3quiz.interfaces.JobLec;

public class Lecturer extends Person {
	private String subject;
	public Lecturer(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
		setJob(new JobLec());
		setGet(new GetSalary());
	}
	@Override
	public void print() {
		super.print();
		System.out.println("\t[°ú¸ñ]"+subject);
	}
}