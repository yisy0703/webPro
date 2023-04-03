package com.lec.ch02.ex1_cal;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MyCalTestMain {
	public static void main(String[] args) {
//		Calculator cal = new Calculator();
//		MyCalculator myCal = new MyCalculator();
//		myCal.setCalculator(cal);
//		myCal.setNum1(10);
//		myCal.setNum2(5);
		String resourceLocation = "classpath:applicationCTX1.xml";
		AbstractApplicationContext ctx
		   = new GenericXmlApplicationContext(resourceLocation);
		//MyCalculator myCal = (MyCalculator) ctx.getBean("myCal");
		MyCalculator myCal = ctx.getBean("myCal", MyCalculator.class);
		myCal.add();
		myCal.sub();
		myCal.mul();
		myCal.div();
		ctx.close();
	}
}













