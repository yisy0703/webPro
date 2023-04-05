package com.lec.ch05.ex2;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class AdminInfoTestMain {
	public static void main(String[] args) {
		String loc = "classpath:META-INF/ex2/applicationCTX.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(loc);
		AdminInfo info = ctx.getBean("adminInfo", AdminInfo.class);
		System.out.println(info);
	}
}
