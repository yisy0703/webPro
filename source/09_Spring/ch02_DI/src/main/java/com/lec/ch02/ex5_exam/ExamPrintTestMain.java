package com.lec.ch02.ex5_exam;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class ExamPrintTestMain {
	public static void main(String[] args) {
//		Exam exam = new ExamImpl("홍길동", 80, 85, 90, 99);
//		ExamPrint examPrint = new ExamPrintImpl(exam);
		String resourceLocation = "classpath:applicationCTX5.xml";
		AbstractApplicationContext ctx = 
		 new GenericXmlApplicationContext(resourceLocation);
		ExamPrint examPrint = ctx.getBean("examPrint", ExamPrint.class);
		examPrint.print();
		ctx.close();
	}
}
