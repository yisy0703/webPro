package com.lec.ch03.method2;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import com.lec.ch03.Student;
public class Method2TestMain {
	public static void main(String[] args) {
		AbstractApplicationContext ctx
		  //= new GenericXmlApplicationContext("xml경로", "~");
		  = new AnnotationConfigApplicationContext(Method2_ApplicationConfig.class,
				  								Method2_ApplicationConfig2.class);
		Student student1 = ctx.getBean("student1", Student.class);
		Student student2 = (Student) ctx.getBean("student2");
		System.out.println(student1);
		System.out.println(student2);
		ctx.close();
	}
}













