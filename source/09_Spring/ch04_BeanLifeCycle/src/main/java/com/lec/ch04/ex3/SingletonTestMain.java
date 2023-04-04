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
		System.out.println("--------------------------------");
		Friend friendProto1 = ctx.getBean("friendPrototype", Friend.class);
		Friend friendProto2 = ctx.getBean("friendPrototype", Friend.class);
		friendProto1.setFriendNo(1);
		friendProto1.setName("존");
		friendProto1.setTel("001");
		System.out.println("friendProto1 : " + friendProto1);
		System.out.println("friendProto2 : " + friendProto2);
		ctx.close();
	}
}














