package com.lec.ch04.ex3;
import org.springframework.context.support.GenericXmlApplicationContext;
public class SingletonTestMain {
	public static void main(String[] args) {
		String loc = "classpath:META-INF/ex3/applicationCTX.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(loc);
		Friend friend1 = ctx.getBean("friend", Friend.class);
		Friend friend2 = ctx.getBean("friend", Friend.class);
		friend1.setFriendNo(100);
		friend1.setName("이순신");
		friend1.setTel("0");
		System.out.println("friend1 : " + friend1);
		System.out.println("friend2 : " + friend2);
	}
}














