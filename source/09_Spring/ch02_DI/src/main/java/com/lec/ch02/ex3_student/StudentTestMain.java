package com.lec.ch02.ex3_student;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class StudentTestMain {
	public static void main(String[] args) {
		String configLocation = "classpath:applicationCTX3.xml";
		// 스트링 설정파일을 파싱해서 컨테이너 생성 - student1, student2, studentPrint 컴포넌트
		AbstractApplicationContext ctx
		  = new GenericXmlApplicationContext(configLocation);
		// 컴포넌트를 가져온다 (DI)
		StudentPrint sPrint = ctx.getBean("studentPrint", StudentPrint.class);
		sPrint.print();
		Student student1 = ctx.getBean("student1", Student.class);
		Student student2 = ctx.getBean("student2", Student.class);
		if(sPrint.getStudent().equals(student1)) {
			System.out.println("sPrint의 student와 student1은 같은 객체다");
		}else {
			System.out.println("sPrint의 student와 student1은 다른 객체다");
		}
		sPrint.setStudent(student2);
		sPrint.print();
		if(sPrint.getStudent().equals(student1)) {
			System.out.println("sPrint의 student와 student1은 같은 객체다");
		}else {
			System.out.println("sPrint의 student와 student1은 다른 객체다");
		}
		ctx.close();
	}
}









