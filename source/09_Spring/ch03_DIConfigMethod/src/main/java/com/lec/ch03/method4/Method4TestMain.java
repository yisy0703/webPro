package com.lec.ch03.method4;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.lec.ch03.Student;

public class Method4TestMain {
	public static void main(String[] args) {
		AbstractApplicationContext ctx 
		  = new AnnotationConfigApplicationContext(Method4_ApplicationConfig.class);
		Student student1 = ctx.getBean("student1", Student.class);
		Student student2 = ctx.getBean("student2", Student.class);
		System.out.println(student1);
		System.out.println(student2);
		ctx.close();
	}
}












