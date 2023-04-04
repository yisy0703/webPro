package com.lec.ch03.method2;
import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.lec.ch03.Student;
@Configuration
public class Method2_ApplicationConfig2 {
	@Bean
	public Student student2() {
		ArrayList<String> hobbies = new ArrayList<String>();
		hobbies.add("요가"); hobbies.add("그네타기");
		Student student = new Student("성춘향", 22, hobbies);
		student.setHeight(158);
		student.setWeight(48);
		return student;
	}
}













