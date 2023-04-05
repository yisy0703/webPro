package com.lec.ch05.ex1;
import java.io.IOException;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;
public class AdminTestMain {
	public static void main(String[] args) {
		// 컨테이너 생성
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		ConfigurableEnvironment env =  ctx.getEnvironment();
		// env의 속성과 속성값으로 되어 있는 PS들
		MutablePropertySources propertySources = env.getPropertySources();
		// PS들 뒤에 admin.properties의 내용을 추가
		String resourceLocation = "classpath:META-INF/ex1/admin.properties";
		try {
			propertySources.addLast(new ResourcePropertySource(resourceLocation));
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("adminId:" + env.getProperty("admin.id"));
		System.out.println("adminPw:" + env.getProperty("admin.pw"));
		// 빈 생성 (admin)을 위해 xml 파싱하고 객체생성
		ctx.load("classpath:META-INF/ex1/CTX.xml");
		ctx.refresh();
		// admin 빈 사용
		Admin admin = ctx.getBean("admin", Admin.class);
		System.out.println("adminId : " + admin.getAdminId());
		System.out.println("adminPw : " + admin.getAdminPw());
		System.out.println("env : " + admin.getEnv());
		ctx.close();
	}
}














