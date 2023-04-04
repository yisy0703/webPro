package com.lec.ch03.method3;
import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.lec.ch03.Student;
@Configuration
public class Method3_ApplicationConfig {
	@Bean
	public Student student1() {
		ArrayList<String> hobbies = new ArrayList<String>();
		hobbies.add("태권도"); hobbies.add("마라톤");
		Student student = new Student("홍길동", 15, hobbies);
		student.setHeight(170.5);
		student.setWeight(65);
		return student;
	}
}










