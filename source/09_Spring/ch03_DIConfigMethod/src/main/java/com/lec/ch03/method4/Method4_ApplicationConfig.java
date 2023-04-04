package com.lec.ch03.method4;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

import com.lec.ch03.Student;

@Configuration
@ImportResource("classpath:META-INF/method4_applicationCTX.xml")
public class Method4_ApplicationConfig {
	@Bean
	public Student student1() {
		ArrayList<String> hobbies = new ArrayList<String>();
		hobbies.add("등산"); hobbies.add("레슬링");
		Student student1 = new Student("홍길동", 25, hobbies);
		student1.setHeight(180);
		student1.setWeight(68);
		return student1;
	}
}














