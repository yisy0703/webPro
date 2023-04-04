package com.lec.ch04.ex1;
import org.springframework.beans.factory.annotation.Autowired;
import lombok.Data;
@Data
public class StudentInfo {
	@Autowired
	private Student student;
//	@Autowired
//	public void setStudent(Student student) {
//		this.student = student;
//	}	
}
