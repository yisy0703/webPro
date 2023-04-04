package com.lec.ch03.method1;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.lec.ch03.Family;
import com.lec.ch03.Student;
import com.lec.ch03.StudentInfo;
public class Method1TestMain {
	public static void main(String[] args) {
		String resource1 = "classpath:META-INF/method1_applicationCTX1.xml";
		String resource2 = "classpath:META-INF/method1_applicationCTX2.xml";
		AbstractApplicationContext ctx =
		  new GenericXmlApplicationContext(resource1, resource2);
		Student student1 = ctx.getBean("student1", Student.class);
		System.out.println(student1.getName() + "의 취미 : " + student1.getHobbies());
		StudentInfo studentInfo = ctx.getBean("studentInfo", StudentInfo.class);
		Student student2 = studentInfo.getStudent();
		System.out.println(student2.getName() + "의 취미 : " + student1.getHobbies());
		if(student1.equals(student2)) {
			System.out.println("student1과 student2는 같은 객체");
		}else {
			System.out.println("student1과 student2는 다른 객체");
		}
		Student student3 = (Student) ctx.getBean("student3");
		System.out.println(student3);
		Family family = ctx.getBean("family", Family.class);
		System.out.println(family);
		ctx.close();
	}
}












