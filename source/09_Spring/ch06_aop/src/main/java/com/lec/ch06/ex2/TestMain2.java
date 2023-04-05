package com.lec.ch06.ex2;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TestMain2 {
	public static void main(String[] args) {
		String loc = "classpath:META-INF/applicationCTX2.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(loc);
		Student2 student = ctx.getBean("student", Student2.class);
		student.getStudentInfo(); // 핵심기능(joinPoint) 호출
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		Worker2  worker = ctx.getBean("worker", Worker2.class);
		worker.getWorkerInfo(); // 핵심기능(joinPoint) 호출
	}
}










